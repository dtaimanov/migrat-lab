/*
 * Copyright (c) 2008-2021 Haulmont.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.haulmont.samples.ratlab.jmx;

import com.haulmont.cuba.security.app.Authenticated;
import com.haulmont.samples.ratlab.core.ResourceProvider;
import org.springframework.stereotype.Component;

import javax.inject.Inject;

@Component("ratlab_Resources")
public class Resources implements ResourcesMBean {
    @Inject
    private ResourceProvider provider;


    @Override
    @Authenticated
    public String addConsumables(String count) {
        return provider.addToAllConsumable(Integer.parseInt(count));
    }
}