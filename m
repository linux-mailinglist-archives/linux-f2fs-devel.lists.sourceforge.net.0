Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B3BF7C7C2F0
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 22 Nov 2025 03:37:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h970ef//yxEesfoz8bGrpemZQuFG+g5HZIR80rNoRtw=; b=D+pTDFwYf9ZduWK2M6Gc13YIn1
	oWFLxUoY2RQiFcprk805gWfcPRwthJ+zMJKK/pUTUFSIewCAaldyiM3+j5qXHf0jZQfyHVvC74vrK
	I2pvcWRoNQqdO/c+JwDQmKXbvvptkCUSiV9RAqjmZVbgtIfFtN2Cf4uebn34/6sEUiHg=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vMdV5-0004Mo-Vv;
	Sat, 22 Nov 2025 02:37:23 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong2021@gmail.com>) id 1vMdV5-0004Mh-8x
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 22 Nov 2025 02:37:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LTshXGL18bUKLOPpXmU1mS8lKJjfdHrexcgQYyjTgmI=; b=kkTH6A46oTfnfvVdNrDCn16Qm4
 Aw5h19Fx9sO6XvF+zSYApZUFyRCqREE8PHgwJpkRvc7EI5+5MUIc6WEvj+N3lskk+Pzqem4l6Tbgk
 lFdkvKzzmoxGyOMV8IlouYc+8cOoB3EfL141399npDWn6onfrpwJ+YQzEbVB1JlNE95M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LTshXGL18bUKLOPpXmU1mS8lKJjfdHrexcgQYyjTgmI=; b=LbYYB8cjsM7Yq/xcFiwnC0xmbd
 2GBnYTeJR3cJJgMHyjOdlr4BcEEJOdOx3RcFQX3rquueGUuXKcbhplHnzqBjDk2D2e86xyCphrjXG
 a5k1ayyu5ICREoehTIqpLND8cYmZW1oiiMtAPkjYvMx/Is4dMc0+1oZqpouS2YcnZXBI=;
Received: from mail-pl1-f173.google.com ([209.85.214.173])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vMdV4-0008QE-TJ for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 22 Nov 2025 02:37:23 +0000
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-2958db8ae4fso26338195ad.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 21 Nov 2025 18:37:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763779037; x=1764383837; darn=lists.sourceforge.net;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:cc:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LTshXGL18bUKLOPpXmU1mS8lKJjfdHrexcgQYyjTgmI=;
 b=WciWZZBcy1qWF0+y2s5f9FofoIDrzruYsSsbFiIWJEk3ni4ZraJoe4FRy8qhJYX+LK
 6vguun5mS8DYCcUkXVCmAiAekVV5vFxcP+i/Bzt80TqPgAUXb/WTnd7ILn0k2zdXArZT
 HTlSv7LY1PpZQBLPqwL9syuvl68nYtukmXkAREn+Kdizul7AGnbVn7AOsnNyXmxZVwIa
 GjbjT6Z/YywCAVtMdec5rU5aUQWPxJvFO4cRLZpt+DXkTBV9rh6wbraia3WSf5d6blrc
 9LTbbqg3UyOHSWC4x3UdN3UqUZ8O7FPO5ml7t980lPkga+lzsxFPbTjRFMVda7Z0bAGK
 elnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763779037; x=1764383837;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:cc:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LTshXGL18bUKLOPpXmU1mS8lKJjfdHrexcgQYyjTgmI=;
 b=KmlHIyKdyCnhc0H9qsVSo//2mmKK8B0/DGYmowkqBKz6xJArxCcSOxvSD4JBWBzHm1
 HRIg60WLxoaok4GQJK/ZyghL87LxNJIVh6kFmU4m7lAukxvbCTqxpGk0U59h3XI6pjjw
 yPaoJPjdM7Vjc/iQBa24d02DOppvSsKZLKVxCffa1ZAf9XxXlvju/LLA8B1qFDw2qnRc
 2MwpmU20CZnjyoP/1NAtBuBo0fLQYo8tlcyaNlatoYh/gOSO9tAAU7j4tHCpbpvKjChl
 JmLEHVl1JS1MEXzjHxlk93rxlv2FqEF0gsAMmg8LLMxLbv9tgjEQgdo11pi/mtSmBSTk
 p1ow==
X-Forwarded-Encrypted: i=1;
 AJvYcCVRjaRduMAgWrpzpPRjY9zzjTauFLXfFKS47YmzhxxrQIGGFCWriX22S7OsAjxxLdGfIxoQ4//BBO+a1HCDlaHI@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yz34BUPklhPSGjrMeDi9xnm4dg0D3ZyjC8eOICKlFPOfXC0xJ8E
 t6ULiwagIzWSymrNWHZmToj1pu86nRE1d3QO4heVNuU3KVD3PeUly/BR
X-Gm-Gg: ASbGncvBYzGt77HmWV7srKpcARIvi0INeCkP9Qz9okP8bK9wxbjduyVT2DIgEppXAnF
 Y61eTLsLY3VeLrxSFAVh2WUHrWsAxkAbp6dxsLNhdw+/0VnWPR/KTWPrGl7rwZRgZSXq7pyLJRA
 6HbbpuVAZfLeL2SIC5mZi5epD6YVxGtwiHdD926e2FdlDs+01Tpx7VlWMLVuqmOe6oxkgNJBxLX
 /ikv0Z2SOWvE3y8OPhMJIfvCaEDRJUiVAvY44hNaa1YmsSr2J0yNZ73xlBaBx5P2BzNjxmlqNo4
 ZqfozOquMn5DonBn1m2r+3yv5mTcqurzCovMpHyifmUz8E2QjeurALsZNz+OJo0jfcRTzuDxjqn
 nno4SH7bQ0AfZAdKF7ruWDjLNcAqAD46BVoW54S6QoNSA90Fqn+fRg1LGhwnwziQrYBSIc1aUyb
 taic+PnexZUoyYKS33DmMc9jF1PIohc71q
X-Google-Smtp-Source: AGHT+IH8vPSYMXWkfdvN9AlrQxj4HKuDHex+xC0+zIvxYGRBHdIgZOfzbMGJ0IXlRgn6uVfsn0Gbjg==
X-Received: by 2002:a17:902:ce88:b0:295:5132:1a99 with SMTP id
 d9443c01a7336-29b6c68be3emr58038785ad.44.1763779037230; 
 Fri, 21 Nov 2025 18:37:17 -0800 (PST)
Received: from [10.189.144.225] ([43.224.245.249])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29b5b25dee4sm70443235ad.61.2025.11.21.18.37.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Nov 2025 18:37:16 -0800 (PST)
Message-ID: <e73b4611-a35c-43f3-9b7a-e417f55dbcb6@gmail.com>
Date: Sat, 22 Nov 2025 10:37:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yangyang Zang <zangyangyang66@gmail.com>, chao@kernel.org,
 jaegeuk@kernel.org
References: <20251121063442.3312116-1-zangyangyang1@xiaomi.com>
Content-Language: en-US, fr-CH
From: Sheng Yong <shengyong2021@gmail.com>
In-Reply-To: <20251121063442.3312116-1-zangyangyang1@xiaomi.com>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 11/21/25 14:34, Yangyang Zang wrote: > This patch adds
 -g option to set default options for specific > environment, especially the
 Android. > When using "-g android" in Android, forced resize is en [...] 
 Content analysis details:   (0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [shengyong2021(at)gmail.com]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [shengyong2021(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.173 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vMdV4-0008QE-TJ
Subject: Re: [f2fs-dev] [PATCH] resize.f2fs: add -g to give default options
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
Cc: shengyong1@xiaomi.com, Yangyang Zang <zangyangyang1@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 11/21/25 14:34, Yangyang Zang wrote:
> This patch adds -g option to set default options for specific
> environment, especially the Android.
> When using "-g android" in Android, forced resize is enabled
> by default, which can solve the problem of resize failure.
Hi, Yangyang,

I think the commit message could be clearer. Something like:

Commit 42482e81248f ("resize.f2fs: add caution message for resize")
introduced the `-F' option to force resizing f2fs without displaying
the caution message. And `add_default_options()` implies that `-g'
enables `-F' for resize by default. However resize.f2fs does not
currently support the `-g' option. This patch adds `-g' for it.

Otherwise, it looks good to me.

> 
> Fixes: 42482e81248f ("resize.f2fs: add caution message for resize")
> Signed-off-by: Yangyang Zang <zangyangyang1@xiaomi.com>

Reviewed-by: Sheng Yong <shengyong1@xiaomi.com>

thanks,
shengyong


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
