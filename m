Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D59C86648
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 Nov 2025 19:01:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xmG2mCJV1AYBdcXKfMggGQWakHO8RT3JopL3E0pJnrw=; b=XBWlhW+knFyiurkBybBrhaHO8t
	2CmMDwBpliqz0l9tcFuQWxxhJOXeJ8tzNXaNuzk53rRCSjZXy8aMF2ifLIHA7TY+Jsa82mUTCnCHI
	+u9bGgK8xtKizdAQzv4ZlYn0/F8Q+D2eErUKJwXKU18Y2CyiCJ08CuuPCBnncblcQ2DY=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vNxLZ-0004rt-TP;
	Tue, 25 Nov 2025 18:01:01 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <axboe@kernel.dk>) id 1vNxLY-0004rV-Rr
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Nov 2025 18:01:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Y/RYkXbjr0Zws5PkDP81koxcOw7wQafJJolXOcPbtL0=; b=Uaza9MPrdAlyQFB42Zc/+ySReX
 7A/aoT+RHny3gvzUZ7AtDOi++PLm3Ch1lSgUJSVUmnm5ziClP2XEW8kqE7FnwSKcW3x1oQFJ4s9V2
 KPxn4eFGyoUZ/ose8V/Zy8Qgs45S7mfXih9bl06it/krXCb3lamd3HjjG9aOvFz6qej8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Y/RYkXbjr0Zws5PkDP81koxcOw7wQafJJolXOcPbtL0=; b=mGuX+hTH1Mss00cX1t0JzqGtu2
 X0dKKBPdylaJV9zf0dlqxWuWtgL31K6r52Xd3kUnhvXxCu+V7EgdsQrHm7J9+cS9P4gM+U4G7uE8v
 py0gf/vmf+/XLM6W/iwdsSb2VheFkhwI12aA9qG6SoyVl7uU5If2PXOcjMTMghSsLmus=;
Received: from mail-oa1-f54.google.com ([209.85.160.54])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vNxLY-0007oE-5X for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Nov 2025 18:01:00 +0000
Received: by mail-oa1-f54.google.com with SMTP id
 586e51a60fabf-3e0e4601faeso2835534fac.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 25 Nov 2025 10:01:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1764093649; x=1764698449;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Y/RYkXbjr0Zws5PkDP81koxcOw7wQafJJolXOcPbtL0=;
 b=xOTVMDb4MBU3kTzwyyHvIvCv1AVfakd2C8YdOofh7fV+N1Qdd2e5ZaEC53zxtTNKR9
 dKZMVXt6C0etfCuCDActL+a6ijIZ9sv5D6vP2I1MUVsXf4AlITed13HgzQnqD8RCpWJ0
 C/uama38xgt8mFTKQ+btxbG1vpM8MJbGt4DCusmE87/3IfeFU5dc1YXBqowItXJRFs6R
 kYZPhLcMoRntm8vhj11Z6r0WiLFhMBM9q13tuGiCYkrxvgqEIEp4OnNZcI5JXFMu9jYF
 UGm7swz8E0uiXaegckpEab1fcsbsWNxR44+2m/KyJtFuY/qJ3vR0OKVDoL3iEc+T6kyS
 SjxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764093649; x=1764698449;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Y/RYkXbjr0Zws5PkDP81koxcOw7wQafJJolXOcPbtL0=;
 b=E9DpF/BNKAKGHMwfPOSgAqQl5RXhjjgAottwJGsR+AKLi+VuEYK2Vhcv0wAOSXONHD
 NQ2xhgElu/Vz21Itzw+VmPO1sOGqz4oF4xK9bC5JYZLX43LFTtc3ivdQX6405b5M2sQ5
 YXeP1FxRsCJKiwNlPWhSQQGuMFBEaE8EPQBR6IygUUE8QeHWn1tNGdR5TqfWLVlNwodo
 7P4gLwSeN8kSfqcnDDHoNRlzUnt6h0QLryNUhZMDu6ZFt6WlS2kXZYsRM8AhBqmz+4Ud
 zSIIs0qLKDUb3lpqRgh3rYDPFksYINNP/U+9DVK28QpJzWPdx2hWPgSoBFowl1RqzcsR
 AM9Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUAwJwZC6KAr+okW9A7+K6qbe5tHsfsjqHc8k/MbUt1T4lFSA4cMi1eHswsGRLtCT9GoP68u9cq2zIfocH0e35F@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yzjem0fP/oUCSJEHUU/cOCT2VHPoK6ckP09JtJ1IQajWIw8ttSu
 PvxdigZzcN6RBK57VT8D3EF6ADiLIeOSwDV6krfSGf8UAWf35TgMFYOXSAjK69oZ4LJ6JYCpswH
 RtaqxLxg=
X-Gm-Gg: ASbGncs9uVw0VhKwknRy6OZ9lEEGZlAqa4YPxjEjGCXx8gGhXlE7O6gMHNx/FzfE64y
 hFcY4smlJFz7ZD/BMW2GdLoz/X25uEmLA5/AJviquKCSftA+0bL98EVQxAmhslG+QFX5tM08hW6
 KWGlKDFz/HOmPlkThW2sZLx/gxdK9OxM3G+8vYDiud0T96y1+nb0it6VT/GOv9XjCuzf0//6ucd
 JRbtPloSie2JundwmAyecLr7buLfySJ/nevZ9uTXAy30/eBPTvW8ugNTVY0UNvXOUKaOYtgD2VE
 PYWyXftkZmCxQuCKjqk5MB7EmDmTHGd2RtnHD1A7IHb/B8NSJwUDUct+cFWS2M02CXw2+oVCJoI
 lZMBV2tZMyB5+ogEmzvNHvuwW6b6RkZbOT7JktP/ZVNeiZdNtyQRD6TkNLDCLilBZ8AM=
X-Google-Smtp-Source: AGHT+IEIHRk7SwMmVS4xtcTCAS6Qp+OrN5pgC4aYwqKQ9jNrDNwsm/zNssFdQ4CwiXZVR7EmZb+prg==
X-Received: by 2002:a05:6638:c0fb:b0:5ac:cd9a:4c4c with SMTP id
 8926c6da1cb9f-5b999555c41mr3179432173.2.1764092295677; 
 Tue, 25 Nov 2025 09:38:15 -0800 (PST)
Received: from [192.168.1.99] ([96.43.243.2]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-5b954b48bdcsm6970840173.45.2025.11.25.09.38.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Nov 2025 09:38:15 -0800 (PST)
Message-ID: <e3f09e0c-63f4-4887-8e3a-1fb24963b627@kernel.dk>
Date: Tue, 25 Nov 2025 10:38:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chaitanya Kulkarni <ckulkarnilinux@gmail.com>, agk@redhat.com,
 snitzer@kernel.org, mpatocka@redhat.com, song@kernel.org, yukuai@fnnas.com,
 hch@lst.de, sagi@grimberg.me, kch@nvidia.com, jaegeuk@kernel.org,
 chao@kernel.org, cem@kernel.org
References: <20251124234806.75216-1-ckulkarnilinux@gmail.com>
 <20251124234806.75216-2-ckulkarnilinux@gmail.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20251124234806.75216-2-ckulkarnilinux@gmail.com>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 11/24/25 4:48 PM,
 Chaitanya Kulkarni wrote: > __blkdev_issue_discard()
 always returns 0, making the error check > in blkdev_issue_discard() dead
 code. Shouldn't it be a void instead then? -- Jens Axboe 
 Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.160.54 listed in wl.mailspike.net]
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [209.85.160.54 listed in list.dnswl.org]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vNxLY-0007oE-5X
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

On 11/24/25 4:48 PM, Chaitanya Kulkarni wrote:
> __blkdev_issue_discard() always returns 0, making the error check
> in blkdev_issue_discard() dead code.

Shouldn't it be a void instead then?

-- 
Jens Axboe



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
