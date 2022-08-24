Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7895D5A0099
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 24 Aug 2022 19:42:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oQuOK-0004UL-Ka;
	Wed, 24 Aug 2022 17:42:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bart.vanassche@gmail.com>) id 1oQuOK-0004UC-1B
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Aug 2022 17:42:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9/CpgnlDbUXJRvbMuCQzNHTlNKCCvlzKRU+dngm+KcY=; b=EKBQFUk+/n6ABQbIp5zDG3/jRl
 +5ZVsY6pq5vPIe9LHtcSBJ1xupJFMYagWPSfh7n7DN5d6SsGdIxrD1bGjHERG/TEHy2DV7ysNe3Ey
 5vh1RFOVzUM61tmuq4WZHYl6UvYAET9i9NAWKjqT5eF445goKE2J5pREwwUava/ovCV8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9/CpgnlDbUXJRvbMuCQzNHTlNKCCvlzKRU+dngm+KcY=; b=hup7T9v0PIUuJXNgpj7qXtusXj
 eUGqZi/2LEjM9Zc8dYXxRJ1Kv+9ljlu80Ri9yZvfYX3tVJM76HfIwdlYnUlSZJxbJtq+8iz78kU23
 JnbPS4gXLTs4CfMyafhbehRm6JOof/kTeqsBcZco0CEyb3VQ7xrtAQEcUkeOSJaA2gRE=;
Received: from mail-pj1-f42.google.com ([209.85.216.42])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1oQuOF-00G874-Py for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Aug 2022 17:42:11 +0000
Received: by mail-pj1-f42.google.com with SMTP id
 p9-20020a17090a2d8900b001fb86ec43aaso1870654pjd.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 24 Aug 2022 10:42:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=9/CpgnlDbUXJRvbMuCQzNHTlNKCCvlzKRU+dngm+KcY=;
 b=DV1OfcNfdB9ofM+5BnqZXDZ1lu6HLzB+nn2e921mUcoLyx/2SKwhBqbR+v/b+iZMjB
 OYO0TQNUwwARF/RvQwyCgqBgBrciBM/iOzf+D15OvfHZ7Xch83jDa2NCHUuWlv1bs6ob
 YSQqUQW+jKL1BEYFNK1n2N1GateKc2xyX2+k7VvxV1HyrLJTsw880D+Q8df0dBSYdwmC
 yogobtQ+/6il8UeU0qGY37XYUeal8nBKs49NmWYSaGGhKgySsuaR+IJmgUBFi9PrUWHU
 y/FcuSgT18nRowqiiMZREkX5rqTLIxqbDjq5HyNM+RsgqjdiV+eGYemf8F/ZzSGdmjTB
 Ourw==
X-Gm-Message-State: ACgBeo323LTtHlnUSNAqc7hOhnCyYv1fuaSbQj1gW/4eihq9E53PbRhP
 YRJMLC4/+Y/UBAusaUKcQW8=
X-Google-Smtp-Source: AA6agR6zMq0VwOtlc8mWN/0kvGwK9eHvyptfDQCEjeQNVCCTYlla1oV+ey19/z/7Tk55eiEAJYL0BQ==
X-Received: by 2002:a17:902:d48a:b0:16f:c31:7005 with SMTP id
 c10-20020a170902d48a00b0016f0c317005mr29799373plg.173.1661362921976; 
 Wed, 24 Aug 2022 10:42:01 -0700 (PDT)
Received: from ?IPV6:2620:15c:211:201:222f:dc9c:99a3:dfb8?
 ([2620:15c:211:201:222f:dc9c:99a3:dfb8])
 by smtp.gmail.com with ESMTPSA id
 jf3-20020a170903268300b0016ec8286733sm12655310plb.243.2022.08.24.10.42.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Aug 2022 10:42:01 -0700 (PDT)
Message-ID: <18f89be5-5283-9801-7d8b-5a08aa0d8928@acm.org>
Date: Wed, 24 Aug 2022 10:41:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20220623181208.3596448-1-bvanassche@acm.org>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20220623181208.3596448-1-bvanassche@acm.org>
X-Spam-Score: -1.5 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 6/23/22 11:12, Bart Van Assche wrote: > This patch series
 fixes one issue reported by Peter Collingbourne and a few > issues I
 discovered
 by reading the zoned block device source code. Please > con [...] 
 Content analysis details:   (-1.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [bart.vanassche[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.216.42 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.42 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.2 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and
 EnvelopeFrom freemail headers are different
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1oQuOF-00G874-Py
Subject: Re: [f2fs-dev] [PATCH v2 0/5] PAGE_SIZE and zoned storage related
 improvements
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 6/23/22 11:12, Bart Van Assche wrote:
> This patch series fixes one issue reported by Peter Collingbourne and a few
> issues I discovered by reading the zoned block device source code. Please
> consider these patches for inclusion in the official f2fs-tools repository.

Hi Jaegeuk,

Please let me know if you want me to resend this patch series.

Thanks,

Bart.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
