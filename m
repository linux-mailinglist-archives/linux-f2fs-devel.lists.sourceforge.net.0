Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 88751B1B7C1
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  5 Aug 2025 17:45:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m6pV9Pw5jmiGuWvNOoAWij+ypI3b8byoPpkcEh2T/RQ=; b=HGVpyZ4Shy/A+8IXVBVGm8AcqL
	xFnOhkR2FUPLAzjYtsI0HPmqNxudP+I9nutSBLcPQZcnXgyMmEv2ysKPXMgTNpcelEVfc0okoy0nW
	0sZu8/8fTKIshOnSilHESM+BAAqxutL8k+Ac6wlkfa06/7F+3il0grHXjGVhoJUBFFwU=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ujJr6-0004dG-C7;
	Tue, 05 Aug 2025 15:45:36 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <axboe@kernel.dk>) id 1ujJr4-0004d8-TM
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 05 Aug 2025 15:45:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=47A3S9FnGtkQV47KZ1o1yY1stYF6mjY7RIPXGnIszns=; b=Xe+qPh9KObjwNbH3Xy2GsBePUj
 b7gYBpi3GJ0i3pAUCVtl8Z/5/Iia81ZdwQXkp/XiraNywf0BwZ+Bh7k4Sn9191s8NcZiHVkeasqyk
 xm8wnr/qzTrSB/HOAUQXAp39FCz9yMqfk57o2Mwv210EfjZHY4n+ZMQQswbZS6f0/Els=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=47A3S9FnGtkQV47KZ1o1yY1stYF6mjY7RIPXGnIszns=; b=W377OCNsXm17vIVFc3y2hhBw9f
 q11ci9zhbL+EU3EL0DiHe+TUkSKVjHVBsmjHt6zYd4z1q0nhETwxJ61aINueSf/lQd63x7xr0P6Jm
 Ijt5r7HkbMo1F1E1bvipcvk38wqukHSQi/rjA5ezciclINXKvkfVlv4nsv+aHbxpM3TM=;
Received: from mail-qt1-f170.google.com ([209.85.160.170])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1ujJr4-0002yl-C4 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 05 Aug 2025 15:45:34 +0000
Received: by mail-qt1-f170.google.com with SMTP id
 d75a77b69052e-4abd3627e7eso75673571cf.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 05 Aug 2025 08:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1754408723; x=1755013523;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=47A3S9FnGtkQV47KZ1o1yY1stYF6mjY7RIPXGnIszns=;
 b=yyFJIo24pY8WIawKB09jsPzLLlLMZxxgQrxfC6xOIDULBQZActjbzaabGN9Xxn+4il
 QyyO/u1If5gMgRrUXfsJCO28lVBhIXx/O2Z8AHDcwL8QoVKB1MJHv+pkqGtg07VejXkh
 DNLArqGesHNKIdhVinUMwg9eu1fg5c+424rwr9YudgBvej58udXS6618a1IGNqU2uK45
 mydxO+oFOfLc4fhh9i9/9QxEIL27SnTP8C+E3Ek07I+3IrHYJvcc36SOHUpYK4QkgLpw
 QMfjwpm6+tdzZ3cEHHzRRkwgNf+CcSra5lKAKMxGzPssjrBX/YCqRwJN0jUomAfnIQ7t
 J92w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754408723; x=1755013523;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=47A3S9FnGtkQV47KZ1o1yY1stYF6mjY7RIPXGnIszns=;
 b=Ww3E01jwC74BCsKS+SCCumwIolbZPix6iuTGgV0hqfmjU9OfUQdhSVaF3alcJKG/k6
 QQAFkHF8WJuS1PSP4A0QKGXL4X2l1OkS2Lhdz/L1zOc0+WP6XbtWnv5ZfevYFbEddeCe
 VkoAKxJmvJ6nMA8rLBRaEODP9TexaMm/rYWPfn1VFE1QrJSiHSV5B+0eTHUJc2qEOSXJ
 Tr4Pf9F5vapJH2rgGOqgsi+0JEhNGQKZH0tjlK+o49SXTUEgPZI7r09Zof9mtjc6S7PB
 pD0x9o9/o7Om6UsPhuU1ceU4WXCwfqFJQpE5e0982YFNt9QGPZDQ6XhRPvtitL6DhVd8
 60qg==
X-Gm-Message-State: AOJu0Yy/aEdM+DkZGpV+F15yOu1cMBPvHGw2zVUdhoWZHmEGV30BU/Fx
 Daih5eNom0ZLFht8HxzZnORMh9fLPhaqdKHLD+IOaWGi9RIUoHOYusrJ1T9kdPIXY4Wev48i9to
 wMlhn
X-Gm-Gg: ASbGncv3CKizq6+adMYQG/kxLNqyvUW0zSz+uX9MK3HPZsPsX/InVW2BJytyml20dms
 3gTlOdsHhEJponnvRmVlK0B6Mw5zauVycG9IOjhL3g21RXyxkjBNQ3CGTR83z1kOcNmGPMO0wfP
 vPh6O9C83pgp4Ol46gEkL8WaxVwG14rlIMzauWdMn1kgPfH46JXsiEE0qdkyNlxiW7iysWS5sFh
 0wtAoEn4gkXKJT8LifBISpNgfiqlA1mJM4viu4gmcqlvSOmxPbpxlWncTYmR4aZBG+CpammCaXd
 YCSqyYCg5oaH0KgGc4k91EuxH7N4Wt2KBZEOFIBeCbeW32llTMGbtRnaG9yvInURiTB4wc/zXD1
 lfWPMnupJCzjZWWe14qOFPZJBwdq7uoU=
X-Google-Smtp-Source: AGHT+IFbGSolRCLm47b3U3xA+x+p+1MYURYNlUpeNbBwyIHwxQaPUJLM1WRayP7DldFQq37IC2UIEg==
X-Received: by 2002:a17:903:2446:b0:240:2e99:906c with SMTP id
 d9443c01a7336-24246f6b703mr201065385ad.15.1754408266480; 
 Tue, 05 Aug 2025 08:37:46 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.157])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241d1f1efe8sm135152195ad.69.2025.08.05.08.37.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Aug 2025 08:37:45 -0700 (PDT)
Message-ID: <587aaee2-8d84-4eb5-9b87-22947abd0752@kernel.dk>
Date: Tue, 5 Aug 2025 09:37:44 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chao Yu <chao@kernel.org>, jaegeuk@kernel.org
References: <20250805061914.3067747-1-chao@kernel.org>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20250805061914.3067747-1-chao@kernel.org>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 8/5/25 12:19 AM, Chao Yu wrote: > f2fs doesn't support
 uncached write yet, for write() w/ IOCB_DONTCACHE > flag,
 let's return -EOPNOTSUPP
 instead of ignoring IOCB_DONTCACHE flag > and write w/o unc [...] 
 Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.160.170 listed in wl.mailspike.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1ujJr4-0002yl-C4
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fix to return -EOPNOTSUPP for
 uncached write
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
Cc: Qi Han <hanqi@vivo.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 8/5/25 12:19 AM, Chao Yu wrote:
> f2fs doesn't support uncached write yet, for write() w/ IOCB_DONTCACHE
> flag, let's return -EOPNOTSUPP instead of ignoring IOCB_DONTCACHE flag
> and write w/o uncached IO.

Didn't we agree that write support should be pursued first before
bifurcating the read/write DONTCACHE support?

-- 
Jens Axboe


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
