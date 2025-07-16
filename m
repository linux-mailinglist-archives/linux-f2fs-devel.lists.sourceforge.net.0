Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 21385B06C6B
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 16 Jul 2025 05:43:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wKAyRL1nLPj9c90eWOVbb9syDlNs+u1H2qiWvFMd73Q=; b=PjdcLn1Equ9NWGYtSk3r47nufh
	EwZc5qxhiWaLSQmmeWcwywja8ZAoF1rIx8WZgZRfvu74TFzU8rbbnuI60io7gGo2YhMNo/F6W3OkV
	T4ql1OXVogh4URJmZNxZ68Xfmw4dclKHM1C8hDG6bLUxMkNly8bhdKzBvogOL7qKLhsU=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ubt3b-0003JV-Or;
	Wed, 16 Jul 2025 03:43:47 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <axboe@kernel.dk>) id 1ubt3a-0003JN-FW
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 16 Jul 2025 03:43:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kRywPbjPUNECVqSBDs9YEV41gpTJb8HiQEnMySC/yNU=; b=MgrNKILz07ZVBStHtaYj29+wYW
 xxyhnphHmSqGw4aQB2xWa6OmWdS0gIDCeNYlltPpmdYDqnbR6Pp5aBLlGPe2cC2AV+2V6rU+S4OJ9
 3qwdH3qKRb5grUDn7P4ahMtJ29O23LMzM18ey3XCagjU5vPRBNsNbJRDyX+patqTX0dI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kRywPbjPUNECVqSBDs9YEV41gpTJb8HiQEnMySC/yNU=; b=l/HDLvxjiyaT8sABV+z1nXniUB
 cWWXN7SCa9QHDEnrnDw0rOHSEn1t4qFuHIypUZzvQ6L+3uGI1Uswxgjl3vP4S5KAcxvLmpBSqXcvk
 6sYNF6FtqhG0gXHXzpcop05rKDiFxItYrnVYneveiIBKOLWponJUQB0ChRrKZY2oVztI=;
Received: from mail-il1-f169.google.com ([209.85.166.169])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1ubt3Z-0004eK-Il for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 16 Jul 2025 03:43:46 +0000
Received: by mail-il1-f169.google.com with SMTP id
 e9e14a558f8ab-3e281f82060so4747705ab.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 15 Jul 2025 20:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1752637415; x=1753242215;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kRywPbjPUNECVqSBDs9YEV41gpTJb8HiQEnMySC/yNU=;
 b=OXu2qmwzI2j2hlqQYB73K2RLS7qVGgID5Q6YUByboP2lT+h2OsnL5P291g0umdOS9Y
 46VJ8UUa4WwG4l7EFL7b6BK/rTcpvpX+b+LM4zuMnNQ/zvyLa/J7cLB4r3shKHbw4Zl1
 zqsw+592m7DUiNF2tI1r3m9PIM360UY6OQpSuYer25XufwgBGBhXwKJTuS+DdeWDT4bo
 jbOne62bmdQQmZFfgy5YEJrVMGo8Chq5ud5OhaBYOPI3AoB2S/X9oVJxy5DOBJTaWOCR
 PPFADH8f/UDSE844rqtaV+JOPwfnPG2o7tdLfavE+2DcSGwmmwyNgl2gAmaLvz03g5ja
 Jfcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752637415; x=1753242215;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kRywPbjPUNECVqSBDs9YEV41gpTJb8HiQEnMySC/yNU=;
 b=DQUxGqaIPYfAPq7ArVNkzE1oSHQnRcGJIdPdv3VpAy/960WLcZVjpe724O66MVp9jY
 WqrUJ1Kem4cBljliimvbd7+kGCnamLD5M7RZCHFyb5YxEEj9WGw7YmW1mk4Mb95SXHay
 UTV3fVWrCq84pILiCor4ox8aOF0LpZE6woXSDvmA1tAmmeIAEDaEOGPOg7IPDx5WzM1m
 J3a/AdX/sXMdEUNpEC3FfEOkrYt99A17O1S5weSg4zqDZ6lsa7rV4/26AL5ge++2Xetg
 WOh003/07H8G3MZVPAkBR9kUz9SyvZlJR8oQhGoat1myovG6OPf/hEKE/6EG13pyzOZn
 ERcg==
X-Gm-Message-State: AOJu0YxPiWV4yNGCUM/NUCoaZcDiHsVf1zj6dPYXdPC6FR9xqnVrscj+
 KhZ41Fqdd//DWoVfpAiWToFQ+sfyCerE6VRtB1PCj3WafHOgDk6xdLmwB3WD4dk+Plg=
X-Gm-Gg: ASbGnctJ5ve7vd4v+ej5ODO03cSFa2N/WQKlPkBYcVr8Aa5dAYlSqUV4Aip96wbXKJi
 hmjYxdZNxzxBL8ke3vxKOBYF3CeEnfeSEWDKCJ55orRIvPcl5wF9HTqvsOiXA4DWq0YzT9gxYLn
 cI9zk+CCIkyjDyFqpMhMg+o2CU0/EaHhjB9vtCfplVclo4y48KBWtTg4ZBYmuB4a60Z7vRq6Fm7
 PZmwD6esXNuuK1m7cVcawpFO2wfp68G1z7laGU0xS8yHzGBFcSiNoN99HCIxNKQfXhxljm8trui
 TDVnSWgN/XgxH7k8qSfF/tuYEf73us9VYSqQiwEmoXOkQ63VUV702D/yZk7QIVv2j8HU6v7AHPS
 n7M0o5uvQkchs9T7oiCU=
X-Google-Smtp-Source: AGHT+IH02x1phQkO00qnSsbe4+BZhG/aefkD3YoymzBKr1j8mthw1kEynEw5v/HN7uryywBkg+07QQ==
X-Received: by 2002:a05:6e02:1566:b0:3dd:920f:d28e with SMTP id
 e9e14a558f8ab-3e282420e2fmr14473775ab.13.1752637414673; 
 Tue, 15 Jul 2025 20:43:34 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.157])
 by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3e24611e6cdsm42309755ab.3.2025.07.15.20.43.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Jul 2025 20:43:33 -0700 (PDT)
Message-ID: <51168786-6c30-4065-be82-6d07b2ae74a8@kernel.dk>
Date: Tue, 15 Jul 2025 21:43:33 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: hanqi <hanqi@vivo.com>, jaegeuk@kernel.org, chao@kernel.org
References: <20250715031054.14404-1-hanqi@vivo.com>
 <056e083b-8e41-45a2-9b0f-2ec47d1a9f71@kernel.dk>
 <f7408161-eaef-47ed-8810-8c4e8f27bfc6@vivo.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <f7408161-eaef-47ed-8810-8c4e8f27bfc6@vivo.com>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 7/15/25 9:34 PM, hanqi wrote: > > > ? 2025/7/15 22:28,
 Jens Axboe ??: >> On 7/14/25 9:10 PM,
 Qi Han wrote: >>> Jens has already completed
 the development of uncached buffered I/O >>> in git [1], an [...] 
 Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.169 listed in wl.mailspike.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1ubt3Z-0004eK-Il
Subject: Re: [f2fs-dev] [PATCH] f2fs: f2fs supports uncached buffered I/O
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 7/15/25 9:34 PM, hanqi wrote:
> 
> 
> ? 2025/7/15 22:28, Jens Axboe ??:
>> On 7/14/25 9:10 PM, Qi Han wrote:
>>> Jens has already completed the development of uncached buffered I/O
>>> in git [1], and in f2fs, the feature can be enabled simply by setting
>>> the FOP_DONTCACHE flag in f2fs_file_operations.
>> You need to ensure that for any DONTCACHE IO that the completion is
>> routed via non-irq context, if applicable. I didn't verify that this is
>> the case for f2fs. Generally you can deduce this as well through
>> testing, I'd say the following cases would be interesting to test:
>>
>> 1) Normal DONTCACHE buffered read
>> 2) Overwrite DONTCACHE buffered write
>> 3) Append DONTCACHE buffered write
>>
>> Test those with DEBUG_ATOMIC_SLEEP set in your config, and it that
>> doesn't complain, that's a great start.
>>
>> For the above test cases as well, verify that page cache doesn't grow as
>> IO is performed. A bit is fine for things like meta data, but generally
>> you want to see it remain basically flat in terms of page cache usage.
>>
>> Maybe this is all fine, like I said I didn't verify. Just mentioning it
>> for completeness sake.
> 
> Hi, Jens
> Thanks for your suggestion. As I mentioned earlier in [1], in f2fs,
> the regular buffered write path invokes folio_end_writeback from a
> softirq context. Therefore, it seems that f2fs may not be suitable
> for DONTCACHE I/O writes.
> 
> I?d like to ask a question: why is DONTCACHE I/O write restricted to
> non-interrupt context only? Is it because dropping the page might be
> too time-consuming to be done safely in interrupt context? This might
> be a naive question, but I?d really appreciate your clarification.
> Thanks in advance.

Because (as of right now, at least) the code doing the invalidation
needs process context. There are various reasons for this, which you'll
see if you follow the path off folio_end_writeback() ->
filemap_end_dropbehind_write() -> filemap_end_dropbehind() ->
folio_unmap_invalidate(). unmap_mapping_folio() is one case, and while
that may be doable, the inode i_lock is not IRQ safe.

Most file systems have a need to punt some writeback completions to
non-irq context, eg for file extending etc. Hence for most file systems,
the dontcache case just becomes another case that needs to go through
that path.

It'd certainly be possible to improve upon this, for example by having
an opportunistic dontcache unmap from IRQ/soft-irq context, and then
punting to a workqueue if that doesn't pan out. But this doesn't exist
as of yet, hence the need for the workqueue punt.

-- 
Jens Axboe


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
