Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2217D86E5AF
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  1 Mar 2024 17:34:25 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rg5pu-0005UN-66;
	Fri, 01 Mar 2024 16:34:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bart.vanassche@gmail.com>) id 1rg5pn-0005U4-Dh
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 01 Mar 2024 16:34:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+4tAl8o/EZq5bn0YeTj7EYMSrlJ3Bl+m9X12avWxbvE=; b=U3yhJe7UGAAKNaLXRbFj2IDI6L
 odZlUsJ64PAxMVXYPHiJRDrxiRrEMnRuVzvg8gi+HTME8vYgt/g2RyUjuTyrv/DOHt4nDSZuV461u
 Mq4S8hF9NRB0FWIVV33Rk1DoNYlhicM7Y0/S6dJaLXjUs8UnMUL+pOsEoApadM8OSYNI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+4tAl8o/EZq5bn0YeTj7EYMSrlJ3Bl+m9X12avWxbvE=; b=KPzhGiKWaKPbC2Uv+yUe6jOKPR
 wGY+K2QV+d5QFuTymHh3yArh9mVYpwtoMwMiVBc/uhtSN6FvjVv1jNZlxRZ3/estFSRYdYeHZyGtM
 Hfdy2qkqRZu2qtJtyc8VS3EgfPKJNiKT1xOYSLszrD3FS+5+TIKDOAGenXXmUU4HoGu4=;
Received: from mail-pl1-f177.google.com ([209.85.214.177])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rg5pm-0003LD-Q2 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 01 Mar 2024 16:34:07 +0000
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-1dc0d11d1b7so20926365ad.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 01 Mar 2024 08:34:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709310837; x=1709915637;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+4tAl8o/EZq5bn0YeTj7EYMSrlJ3Bl+m9X12avWxbvE=;
 b=OSvm0OPcSAa728tO8/ToLYNCohDbqRq1cL7cxIemZycnIWxOXvqBlcTBEx5uOkJ4eS
 6q0rcVv3ugSB25ZPd6eeY631nHrVJDgjSpmEZ2Hnqp+OtXGD5Hrfh2dklDiCw1GPiXUZ
 1zB3CpGWpefAPyd36KJc/aoT5wb6KB4tpOiLegjzpxA6elWee/bK7LOFADbW/DT4zjop
 lJdnL0O9URgoYRGC2RSJNFDBaQA5WI6Fgi+O3Lb8+gNpjJIspLabJb68H9LFw+BW9N29
 SMDzmkyILMiOHKoAyv1WOOj6Z1HtfgWcDpeFk8gZFytE8snFYz92ASbZ57tu6t47K24x
 G+1g==
X-Gm-Message-State: AOJu0Yy/8xqBDyyAMaKZgXmMwXcX2NT7R87AV7nHbL7T7AnFrg1/tO74
 KgNnMJSUvhEbTh9ewBBwJ1+mq8T5RpciaWIGYURY4vvFGh2HoVdZ
X-Google-Smtp-Source: AGHT+IHdceNVpyQZsGCQCn1QEhLzR/NvShnqMky+vyWW6kRZoXif944dAjyAXytLg96tKLlrUOz+Bg==
X-Received: by 2002:a17:90b:11c4:b0:299:61eb:c75e with SMTP id
 gv4-20020a17090b11c400b0029961ebc75emr2153875pjb.23.1709310836533; 
 Fri, 01 Mar 2024 08:33:56 -0800 (PST)
Received: from [192.168.51.14] (c-73-231-117-72.hsd1.ca.comcast.net.
 [73.231.117.72]) by smtp.gmail.com with ESMTPSA id
 sn7-20020a17090b2e8700b00298ca131c75sm5582786pjb.24.2024.03.01.08.33.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Mar 2024 08:33:56 -0800 (PST)
Message-ID: <399ee6af-c1da-40ab-a679-065aa82f41ab@acm.org>
Date: Fri, 1 Mar 2024 08:33:54 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: eunhee83.rho@samsung.com, Yi Zhang <yi.zhang@redhat.com>,
 Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
References: <CAHj4cs-kfojYC9i0G73PRkYzcxCTex=-vugRFeP40g_URGvnfQ@mail.gmail.com>
 <esesb6dg5omj7e5sdnltnapuuzgmbdfmezcz6owsx2waqayc5q@36yhz4dmrxh6>
 <CAHj4cs874FivTdmw=VMJwTzzLFZWb4OKqvNGRN0R0O+Oiv4aYA@mail.gmail.com>
 <CAHj4cs_eOSafp0=cbwjNPR6X2342GF_cnUTcXf6RjrMnoOHSmQ@mail.gmail.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <CAHj4cs_eOSafp0=cbwjNPR6X2342GF_cnUTcXf6RjrMnoOHSmQ@mail.gmail.com>
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2/29/24 23:49,
 Yi Zhang wrote: > Bisect shows it was introduced
 with the below commit: > > commit dbf8e63f48af48f3f0a069fc971c9826312dbfc1
 > Author: Eunhee Rho <eunhee83.rho@samsung.com> > Date: Mo [...] 
 Content analysis details:   (0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [bart.vanassche[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.177 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.177 listed in wl.mailspike.net]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.0 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and
 EnvelopeFrom freemail headers are different
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1rg5pm-0003LD-Q2
Subject: Re: [f2fs-dev] [bug report]WARNING: CPU: 22 PID: 44011 at
 fs/iomap/iter.c:51 iomap_iter+0x32b observed with blktests zbd/010
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
Cc: linux-block <linux-block@vger.kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2/29/24 23:49, Yi Zhang wrote:
> Bisect shows it was introduced with the below commit:
> 
> commit dbf8e63f48af48f3f0a069fc971c9826312dbfc1
> Author: Eunhee Rho <eunhee83.rho@samsung.com>
> Date:   Mon Aug 1 13:40:02 2022 +0900
> 
>      f2fs: remove device type check for direct IO

(+Eunhee)

Thank you Yi for having bisected this issue. I know this takes
considerable effort.

Eunhee, please take a look at this bug report:
https://lore.kernel.org/all/CAHj4cs-kfojYC9i0G73PRkYzcxCTex=-vugRFeP40g_URGvnfQ@mail.gmail.com/

Thanks,

Bart.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
