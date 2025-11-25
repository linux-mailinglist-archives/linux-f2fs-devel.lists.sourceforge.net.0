Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA63C877CF
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 26 Nov 2025 00:41:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Date:To:From:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EIkkoMUY7WeDO6ukCrvdRD0PlZcnX+zOc5I7UG7SRGc=; b=G7IiDaEAUvB1u1aJwzxtzS9jxO
	39fBCT59wekChfnF1hAtCQlpUZu8+64/mlx78F+rYuA2B7FQv8WxmUHB3hLaoT8eOYX5bzCNquMLa
	hsF1QuZNvl/fe4RBGSIfYGqKdfC060p1N+luXMPRE2Ar+wq1a17aN/Vgl50rujW8AUA4=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vO2fD-0004Uv-RG;
	Tue, 25 Nov 2025 23:41:39 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <wilfred.opensource@gmail.com>) id 1vO2fC-0004Un-B3
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Nov 2025 23:41:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gWMb0VoUFPvI9dqT/ScM08+SFgSz52WvWw6dKZyzkX4=; b=DYqSOB2rgi4inyKslAyE3fHAsc
 EmRWOwF4g3WO16vFWCwnLKH0WA0CogVDjUiwFCduz6JPyF7rZxBT1orX9qSb7/6x/zXT0X2NlOk6E
 pfbJ0CZAZqoHzgrr+hT1MFhKTFcK5egHMXbcxSIopj0+YOmpjG/gbjz5fznynC8ci4Zg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gWMb0VoUFPvI9dqT/ScM08+SFgSz52WvWw6dKZyzkX4=; b=ifSpI+9PtVu+chH37eRNzwNtxm
 luUVdTB0uIQ/F32G9qtiyCFPCJdKUPfVGhjTGAW3pFr3jdFGaZpQ53TJBVV8+QKrenjhpMkgWeaeK
 7cV4IzFgIfhR/exXAsqTjd1WCveymnvbBHBU+cxT1ExzOwXPATnBWTpwRPEEPzuRai/E=;
Received: from mail-pj1-f53.google.com ([209.85.216.53])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vO2fC-00047h-1O for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Nov 2025 23:41:38 +0000
Received: by mail-pj1-f53.google.com with SMTP id
 98e67ed59e1d1-34361025290so4844753a91.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 25 Nov 2025 15:41:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764114087; x=1764718887; darn=lists.sourceforge.net;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=gWMb0VoUFPvI9dqT/ScM08+SFgSz52WvWw6dKZyzkX4=;
 b=cX7PueKKgFw64rqDronZ71qcne4mdvB8bUbMdDTAJ1sRppthLIB+il2dPYEv/zIcHn
 mAVk5wux1PH+S9gxGk8gZ11yA/ZODryRhc0x0eG2nQ+PRaw44KHTOOpt0KMNrhbkWQ3D
 8VRSapVBN7tmJoL5mVLtzJ3/QKAYqoMvLI466mS9aqcNmrxj8W/QUj6sd/gJ4LdOvgOl
 ZsvTutA9j0DBh3zwoSjyK0Ys0s51LsfH+g1iGSnPBGlfcaYPzhWf++MWGRxatwpTOWgi
 mwOtwbAp/Hh75rx8Z6lsYOYfVhvd4nY49dfxKnnq7+YR5kJc8MWjUXdbbr40DlZjoeTe
 V6vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764114087; x=1764718887;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gWMb0VoUFPvI9dqT/ScM08+SFgSz52WvWw6dKZyzkX4=;
 b=oIQW5fBjaxgXXWuraYeuOkHz7PxFAScT9CRTlOICBAdH7SEQXiz2tfEhEsLnsauhfj
 +JeOCGgzVST5hcX3HyhFjpftj4QawTpHZRfZPZ/s9Ye/FmSKnsGGgHUDzHsh8Gljutmi
 0/Nc6G5Nlpxyeq4ldjn0GGltIzy0/frMhNM7kp1N03TFs0ha0n/9fbj4uCG8Qu5DYbuy
 hlFwc/1ykr+ae9M5FsMaFAfptPKhV3rXkA9TbjIC2SBRoclZ6oVtQHF2gRjTs9h67mRw
 K0yU+IrEAEzlhHixC6V3S4MoqD3QwhB4WjoD9Eu6FGBzRWVZLfLMP38m+QiNh8fZ5LB2
 mDng==
X-Forwarded-Encrypted: i=1;
 AJvYcCWR0GDX7b/mz3VScIuWc6drn7lvBXc0BOXNM0jFbHjNVFp+O73j39cgIM9i5qVK/8SjiE+jazqUcK2V5eGue68+@lists.sourceforge.net
X-Gm-Message-State: AOJu0Ywaq5G9T+OlMZskSJlGeZGCei6Zuh7thptCJ8NburS3TuN+G7eh
 Y3DOaEhL7g7O2gJfCL8hnhx1QBQCqHJSHU9jGwgtut4Y7Nc8nlFerHEC
X-Gm-Gg: ASbGncvN1yAR47QzpR7UIfmAdOMpqQlRztdSog3yGFCSxMwnZj9E+qJBP5+BW5+4fUM
 pLe5Zp/Irkj7hTGYr8DoSlGrApMkoh9B+k1hrGYKjNUKfPiscWA92NX/UIyPbzGIPEv0aIFSD1k
 8yatK8g0aNU6IgzZfA+2e6T5XR9IjK7i8wDR5g3YZv0IxDumzQRI+dQQP5JBkDyTJMtopn9Lm3U
 8PfHWtvGrpTbWz/MdHozYfVxojW5qKa0J0t50P1rTBj5Qk1sk0kWhGJ+/C8AStXTSpZcOIUq0Po
 8cXYOFRQwsihtgBdcA65F/dhdxSQFe9DVEo3JfzS/J31TB0tR8zBxGN5bL1BQnyC0L5vvSPYkTl
 OVfip2075F+aqRf6MTxeIg0Vccw7KicF6rHFFzLllPYdc/SbBiDtMiCnpQ/VV0pPaviOQxaskzw
 BqJgpJQwbeTGoa8PT+tAjcVJ6ChVdLtX9sc+i33g==
X-Google-Smtp-Source: AGHT+IERAr6ZaAk8N2XfP1sLPZ8ltdcZpy2by33AewknK2HCsGdLuO/dThk3nDRSpzRLveBkNTfbCg==
X-Received: by 2002:a17:90b:3b41:b0:33f:f22c:8602 with SMTP id
 98e67ed59e1d1-3475ed6ac44mr4636649a91.26.1764114087385; 
 Tue, 25 Nov 2025 15:41:27 -0800 (PST)
Received: from [192.168.0.233] ([159.196.5.243])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7c3f0e6c9bcsm19291748b3a.57.2025.11.25.15.41.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Nov 2025 15:41:26 -0800 (PST)
Message-ID: <2f356d3564524c8c8b314ca759ec9cb07659d42a.camel@gmail.com>
From: Wilfred Mallawa <wilfred.opensource@gmail.com>
To: Chaitanya Kulkarni <ckulkarnilinux@gmail.com>, axboe@kernel.dk, 
 agk@redhat.com, snitzer@kernel.org, mpatocka@redhat.com, song@kernel.org, 
 yukuai@fnnas.com, hch@lst.de, sagi@grimberg.me, kch@nvidia.com,
 jaegeuk@kernel.org, 	chao@kernel.org, cem@kernel.org
Date: Wed, 26 Nov 2025 09:41:19 +1000
In-Reply-To: <20251124025737.203571-3-ckulkarnilinux@gmail.com>
References: <20251124025737.203571-1-ckulkarnilinux@gmail.com>
 <20251124025737.203571-3-ckulkarnilinux@gmail.com>
User-Agent: Evolution 3.58.1 (3.58.1-1.fc43) 
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sun, 2025-11-23 at 18:57 -0800, Chaitanya Kulkarni wrote:
 > __blkdev_issue_discard() always returns 0, making all error checking >
 at call sites dead code. > > For dm-thin change issue_discard() re [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [209.85.216.53 listed in list.dnswl.org]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [wilfred.opensource(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.53 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vO2fC-00047h-1O
Subject: Re: [f2fs-dev] [PATCH V2 2/5] dm: ignore discard return value
X-BeenThere: linux-f2fs-devel@lists.sourceforge.net
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-f2fs-devel.lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=linux-f2fs-devel>
List-Post: <mailto:linux-f2fs-devel@lists.sourceforge.net>
List-Help: <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=subscribe>
Cc: dm-devel@lists.linux.dev, linux-raid@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-block@vger.kernel.org,
 bpf@vger.kernel.org, linux-xfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Sun, 2025-11-23 at 18:57 -0800, Chaitanya Kulkarni wrote:
> __blkdev_issue_discard() always returns 0, making all error checking
> at call sites dead code.
> 
> For dm-thin change issue_discard() return type to void, in
> passdown_double_checking_shared_status() remove the r assignment from
> return value of the issue_discard(), for end_discard() hardcod value

Hey Chaitanya,

Typo here s/hardcod/hardcode. Otherwise, with the split as other have
suggested:


Reviewed-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>

Regards,
Wilfred


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
