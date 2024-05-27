Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C048D2190
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 28 May 2024 18:23:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sBzbq-0005D8-2p;
	Tue, 28 May 2024 16:23:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <gustavo.schenkel@gmail.com>) id 1sBzbo-0005Cu-SW
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 28 May 2024 16:23:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:To:Subject:From:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4aEY/VZ0kOW3TO79bbaxiQdw+PPKgHYYJ4mnExDE3Dw=; b=LV/Azv6suGkQhkBUvHwlpuvz8z
 +wh8UyFYp+WoN7wolSxd9WEeMdiXvLU5UWjT27BiPaVPZUvyia4FfmKIv0vFWDIo+H1X+RN054dWQ
 3J0qdEsRfACUatGEp07+4bQK9k7wkgkg7iA0UsmuNFXAq2DVtk24GYZZqimaHSHUeSX4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:To:Subject:
 From:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4aEY/VZ0kOW3TO79bbaxiQdw+PPKgHYYJ4mnExDE3Dw=; b=ETMvbE36fYPCxb5gISliiwe+Sx
 B9R3Ap7td/S8LLMyIbknMJyHj7FDgTMeZWOFL0U8xci1HgFLnTdBzQ8zD39Wkn2WIQB+Y9AEzxeRV
 1BBCWuwCFmimJGqMaso1HG4w/s3l0QbnAeNRjiM+xUT+uIel9zxQ8S+YyrZ0QzVaITDg=;
Received: from mail-qk1-f174.google.com ([209.85.222.174])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1sBzbp-0005ZF-BJ for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 28 May 2024 16:23:33 +0000
Received: by mail-qk1-f174.google.com with SMTP id
 af79cd13be357-794cbdc2314so65589885a.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 28 May 2024 09:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1716913402; x=1717518202; darn=lists.sourceforge.net;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :to:subject:from:user-agent:mime-version:date:message-id:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4aEY/VZ0kOW3TO79bbaxiQdw+PPKgHYYJ4mnExDE3Dw=;
 b=CbbF+YxX5qPCuOBMT/nC92mLVrcEtuvoPIpzWocMlJutqjoGiza8t1l7M4Q5H7ebil
 aIAOttKmxDdicF0NxL3XoE9UffG55RJCld1STT+Le6d28qAGmKFS/JkEWjrRi0/iTxP/
 HyTGcr8wsptPxWqhVIWH5SyIRKHhmy+dPhmAYNpB5v8+A0Z5p0g1ddFIwwVEg2+JTgA7
 REsHYBMi5VZoaj/v+2SZTZpNWFQnIFrVaYxhViMLl///cxDgS+cpm9hZ75l6wgmVRtnW
 pG/8vX57Q9p41utniRgeE/rmoga9nDMXqEs7GQui6ku8rV+74Fld2ETjrXdYtUBtFrmx
 XJBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716913402; x=1717518202;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :to:subject:from:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4aEY/VZ0kOW3TO79bbaxiQdw+PPKgHYYJ4mnExDE3Dw=;
 b=bcHcPohYa+lwaq5bAXjBTUnrGv9P/b35R2l9SRnf16HVceV9lrTHJT5Lf2a8++N1CI
 qPzcpxvDE1pUsHj536h9JE8HfPbWTr2NtjqnU/NCJ5A0tew7BUV7P0+05FLgIJj0V7hk
 hUVfCl8LYQiT96h4Be3AZiTEJPZxJScX/yn70L852RV8l/ejZHbr0X1cjuv1UqXvuduS
 wygBW20m3CyfqL39jn0yLCFQ4MFxBTdm4Q+nS4mn5x4blkJqfw35Vmy6NcHLgGD8oIaY
 NQYu2RoAWRyL+N4egYEDypuXy6kxQhDmEkIsSxlLmbWrnp+fzP+i6VKQoeknBFfrmUxi
 4TnQ==
X-Gm-Message-State: AOJu0Yz9su3UOp3gXsiAIGFPiSNzn/y9FRezQq5i/f81bOX9vOFevah2
 uvHzZnprpzX2WKVAcyDvyldppG+g70bx/FeXm8+JbnKnIx32SPlsaFVZgrFP
X-Google-Smtp-Source: AGHT+IHyyK9R+xE+MtpfI+UAMFtrboJJduXIZ818GnkIr7zOYph0pzCdXWMyUAy3gUzpvIq3+Gb5Dw==
X-Received: by 2002:a05:6a00:330d:b0:6f8:d499:2d41 with SMTP id
 d2e1a72fcca58-6f8f3f8ba84mr12440692b3a.24.1716847076494; 
 Mon, 27 May 2024 14:57:56 -0700 (PDT)
Received: from [10.83.3.140] (177.204.11.224.dynamic.adsl.gvt.net.br.
 [177.204.11.224]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-701b2219980sm508796b3a.46.2024.05.27.14.57.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 May 2024 14:57:56 -0700 (PDT)
Message-ID: <bf02d65d-876f-4a90-84b5-595707659fb0@gmail.com>
Date: Mon, 27 May 2024 18:57:52 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Gustavo Brondani Schenkel <gustavo.schenkel@gmail.com>
To: linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <2024052527-panama-playgroup-899a@gregkh>
Content-Language: en-US
In-Reply-To: <2024052527-panama-playgroup-899a@gregkh>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi,
 since upgrade to Kernel 6.9 I am getting Issues when booting
 using f2fs. If I am correct, I am receiving `fs error: invalid_blkaddr` in
 two distinct drives, one nvme, and other sata. Each reboot t [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [209.85.222.174 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.222.174 listed in sa-trusted.bondedsender.org]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [gustavo.schenkel[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.222.174 listed in wl.mailspike.net]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1sBzbp-0005ZF-BJ
Subject: [f2fs-dev] Issue with f2fs on kernel 6.9.x
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi,
since upgrade to Kernel 6.9 I am getting Issues when booting using f2fs.
If I am correct, I am receiving `fs error: invalid_blkaddr` in two 
distinct drives, one nvme, and other sata.
Each reboot the fsck runs to correct this suppose error.
If I downgrade to Kernel 6.6.29, on the first boot, fsck runs just once, 
than after reboot is normal.
I used 6.9.0, but in 6.9.1 it took my attention because I don't reboot 
often. One 6.9.2 the Issue persist.
Since I didn't find nothing about issues on kernel messages I am trying 
reach you.

I use Slackware Linux 15.0-current, and debug flags are disabled by 
default, but if you needed,
I can rebuilt the kernel with the flags you say are needed, to find what 
are happening.

PS: I didn't find any better way to report this issue, said that, sorry 
if this is the wrong way to do so.

-- 
Gustavo B. Schenkel
System Analyst
B.Sc(IT), MBA(Banking)



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
