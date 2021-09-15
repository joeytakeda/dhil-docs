---
title: To Do
layout: default
parent: Colophon
nav_order: 2
---

# To Do List

<ul>
    {% for todo in page.todos %}
        {% assign currPage = todo[0] %}
        {% assign items = todo[1] %}
        <li>
            <a href="{{ currPage.url | absolute_url }}">
            {{ currPage.title }}
            </a>
            <ul>
                {% for item in items %}
                    <li>{{ item }}</li>
                {% endfor %}
            </ul>
        </li>
    {% endfor %}
</ul>

