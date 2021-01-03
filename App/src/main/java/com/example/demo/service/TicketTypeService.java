package com.example.demo.service;

import com.example.demo.entity.TicketType;
import com.example.demo.repository.TicketTypeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TicketTypeService {
    @Autowired
    private TicketTypeRepository ticketTypeRepository;

    public TicketType getTicketTypeByTicketTypeName (String ticketTypeName) {
        return ticketTypeRepository.findByTicketTypeName(ticketTypeName);
    }
}
