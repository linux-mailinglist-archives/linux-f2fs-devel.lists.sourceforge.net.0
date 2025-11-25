Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE45C86C39
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 Nov 2025 20:19:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LhTVC46MmqYfLI9O32j8p6NnhvwHkfUcaq61M7VN5Dk=; b=b7gyr2V6W/0JNW2dPLXYHBPngT
	Qfk6W6hgYZ8z7wRPpc7SO4qVfBVNodnNLwxj33riiL1jxNb5s33Bzq/fH17a+xUgw//HoaXMQPhHk
	4aQy3TgcpkZl5s0qbIMfj7FqwMyMic/Y8gD3UxA+u8W35pfdRBl1VAW28E/n2k3E/O94=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vNyZS-0007qd-JL;
	Tue, 25 Nov 2025 19:19:26 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <axboe@kernel.dk>) id 1vNyZQ-0007qT-3n
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Nov 2025 19:19:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mUfqGNY8yNMCOlzV27bzhMu4chO9eJxWxW9kWFtTcZI=; b=dCtR4B6OB4JYBO31VGoIxKJZNH
 4ihOKQy2LZqkhJj/p0VokrWX2LLpg2FXZOKOVpXhj3RG10zs8ApSeDQ+H3W36b7kWiMiA2wP2fmnn
 2041/dQtMN2ctqH7UXGuxno9GmkR1skdD8EzIy9zn8PJcrsi1xnERGxEGFdtkxKDnWBI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mUfqGNY8yNMCOlzV27bzhMu4chO9eJxWxW9kWFtTcZI=; b=c+GUvXwJijOdn/VlqUd7gAzZsc
 VG1wnkGFAuQkXRj1N/A8nHB4386eEuM6s2+cKEx+IakdNO0AI5dLT12AoMfysf0F7hCGQF7ZjOgin
 9PwWaEljXmevC5h0un+sjP0MqjzwgDZ9BfSJ8Yk740XSHj6FTqvxiQUEx8wxl7RIkyoo=;
Received: from mail-il1-f174.google.com ([209.85.166.174])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vNyZP-0003TX-8p for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Nov 2025 19:19:24 +0000
Received: by mail-il1-f174.google.com with SMTP id
 e9e14a558f8ab-4331709968fso25259675ab.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 25 Nov 2025 11:19:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1764098352; x=1764703152;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mUfqGNY8yNMCOlzV27bzhMu4chO9eJxWxW9kWFtTcZI=;
 b=vizfHLEkusijJEyXJEX/LE/7e0QHo9NO06LrU/TPtImtB6On+rfVS8bd+b4qZ6oC9B
 beDNztUjnD6xMlNoAaK6DwIevY2gEzdtAJo7nd2SwpNWnFXBIb8R9H2PzWcRqJvzGBTw
 Ad1YhH1VvrbE5meQBZd4XRYzHFpaRPxzPC8E4ydpBeQ9hq68HgPE2OPCA4sPN0cwV9iR
 vaBmao35Jmnq3CAuzaFDZwg5044SZXICMk62XSoKeQVOG0UKUSH5FYyPrrCPIm577BGV
 z+fuYaT26PYV5++0I5U09zD1VXHDbghFrMGKAf39qVCpxR3ZWKcyguk3rarYI1HpZzzZ
 0lpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764098352; x=1764703152;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mUfqGNY8yNMCOlzV27bzhMu4chO9eJxWxW9kWFtTcZI=;
 b=fw91rpUOo4Y1tY7vXCvyGJpbl1/t14yo9B5ZFBcO5aLq3BX6ZwtfmUy9Likji0edR+
 ANQPIZa1faUpse95YOWzIL1R55FZ4+v+TqweLGk5fJy9MqSL+BPwTOEJ7lCGmFT6J12n
 vaxYJqnsLiRsOdpvARKdp4zTeRoi4RJeaqFX2cWBg4ECdpLq+YcG1qNaLckJ6P+0A4WR
 Y6SLTn4qoHs39fhOk6waBvX3xSWZI7FFpx/9NcP2hn3t4injdXN+K0oOiFwricb1RzDD
 PBGgrmENtw2R5gQH8vmJEbemTMrv6PSDD44WFPP4Eudo2EJyOZFNVDM1fj2WPbLIHe9X
 PFgQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV4KbgCIp7fHB2ZXP+r3VZeLb5AZiG6qLT+1LX6qmUqoUyVrlkNHL9jima2SCLtzM8FHnDPoW7OIhf/g8fQJPOg@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxPEjqKVQrk6QgqLPT3NEF/WBqbLjuzbCPkqTVHmM1USKDmz+v+
 Dy9MNQPjRxdFEwnYbVRRoZ14f0Oxxv6TGOgkIa+JXH0qY2nP7k2avhu9Qt4XDnoO4zw=
X-Gm-Gg: ASbGnct/cZ3CKQbyxGNn5agU6mdn8BthULu7dB7lChdQlMTqWc6qDOVa9OR9lamZsi1
 LKgCfIHd1AukJpmIB/+TO8P5DYdud+KePM0jw9LydZJDQTRtP9sTTfTwJYgp9AwTECWWgq0Ea4/
 efFGeYl+EOpbSJjo1lrw5T8gdKEnVNweDdVEaaOPpf/PqbmDRY5iEOJDPOIO3kCMeaZGLd6z+hc
 nGiMCPLzft3a1x42RrgeUsNNWdz202PYrYCx3kPgKtmfOjS/ixU/ZLEXZmf36Bh5C2nrvDqzhDE
 MgLdKbvIl9LIFaGItjltIjomAOICQOwYmG7EiNTyEMFBz8Ao591VmacKZxxoKkKDwRCQN2pylYA
 lp83k0iJJfiXDw15OdhbkGEbtwB6CLPTh8JmFqlnPACD+Yhn+ViOrOgQ4nBQYd9Pg6MAgbos8Et
 rBdNfehw==
X-Google-Smtp-Source: AGHT+IFQEaswkUqFfWJbDMiqY0I1VozYHdfo1ZahjMrEfHe7a5FmQfgVW6+5KRthy6ytF5ENx/5MzA==
X-Received: by 2002:a05:6e02:330e:b0:434:70cd:e27d with SMTP id
 e9e14a558f8ab-435b8e6957fmr145921635ab.24.1764098352527; 
 Tue, 25 Nov 2025 11:19:12 -0800 (PST)
Received: from [192.168.1.99] ([96.43.243.2]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-5b954b48ed9sm7452092173.50.2025.11.25.11.19.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Nov 2025 11:19:11 -0800 (PST)
Message-ID: <a192b8dd-6d67-475c-972e-a88d6d8b8e5a@kernel.dk>
Date: Tue, 25 Nov 2025 12:19:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chaitanya Kulkarni <ckulkarnilinux@gmail.com>, agk@redhat.com,
 snitzer@kernel.org, mpatocka@redhat.com, song@kernel.org, yukuai@fnnas.com,
 hch@lst.de, sagi@grimberg.me, kch@nvidia.com, jaegeuk@kernel.org,
 chao@kernel.org, cem@kernel.org
References: <20251124234806.75216-1-ckulkarnilinux@gmail.com>
 <20251124234806.75216-2-ckulkarnilinux@gmail.com>
 <e3f09e0c-63f4-4887-8e3a-1fb24963b627@kernel.dk>
 <851516d5-a5e8-47dd-82e0-3e34090e600d@gmail.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <851516d5-a5e8-47dd-82e0-3e34090e600d@gmail.com>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 11/25/25 12:09 PM, Chaitanya Kulkarni wrote: > On 11/25/25
 09:38, Jens Axboe wrote: >> On 11/24/25 4:48 PM, Chaitanya Kulkarni wrote:
 >>> __blkdev_issue_discard() always returns 0, making the error [...] 
 Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.174 listed in wl.mailspike.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1vNyZP-0003TX-8p
Subject: Re: [f2fs-dev] [PATCH V3 1/6] block: ignore discard return value
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
 "Martin K . Petersen" <martin.petersen@oracle.com>,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>, linux-kernel@vger.kernel.org,
 linux-nvme@lists.infradead.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-block@vger.kernel.org, bpf@vger.kernel.org, linux-xfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 11/25/25 12:09 PM, Chaitanya Kulkarni wrote:
> On 11/25/25 09:38, Jens Axboe wrote:
>> On 11/24/25 4:48 PM, Chaitanya Kulkarni wrote:
>>> __blkdev_issue_discard() always returns 0, making the error check
>>> in blkdev_issue_discard() dead code.
>> Shouldn't it be a void instead then?
>>
> Yes, we have decided to clean up the callers first [1]. Once they are
> merged safely, after rc1 I'll send a patch [2] to make it void since
> it touches many different subsystems.

OK, that make sense. I'll queue patch 1.

-- 
Jens Axboe



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
