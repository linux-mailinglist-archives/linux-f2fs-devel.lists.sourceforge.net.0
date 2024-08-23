Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C141A95D63E
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 23 Aug 2024 21:51:09 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1shaJJ-0004kb-Oa;
	Fri, 23 Aug 2024 19:51:01 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <josef@toxicpanda.com>) id 1shaJI-0004kS-3q
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 23 Aug 2024 19:50:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GvDUOtqcbYcBaJm8eltM8LTQ5pM/0IWo4qbVFUFMhb8=; b=R244m4b7o168Cu5tDMQkz8Dndq
 0S1t2mvTrEFtbMBkRyIHE/9IJ7kkC4ghjeAC/XjhiFml9q4JBhXC+Y2GDJHqVf/Yj0QmSTzbM/qpZ
 7ADSvF+VIsXShrh8az8wtH50eEdNbd6TfQ18bDawBc94DMzb5+P34cXEuGofZ9D+mnzM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GvDUOtqcbYcBaJm8eltM8LTQ5pM/0IWo4qbVFUFMhb8=; b=I3K+6Z8HS3ULJVUXiXABO/h/me
 O8ddwGcs7+SR8KPj6ZxMR7nNztHhj3j4JrneYfAPVE2eC2TnI0a/G7X10erEKVJ6zqcbKk8Rog7tx
 OmIM12rGmkxVcMMZ7JcU6N9I9RwDD/dwjVL5y7RbWg9P+TcI9Md91Qkd2lCr6H0/zCQU=;
Received: from mail-yw1-f181.google.com ([209.85.128.181])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1shaJG-0003jb-NA for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 23 Aug 2024 19:50:59 +0000
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-6c0ac97232bso20543387b3.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 23 Aug 2024 12:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=toxicpanda-com.20230601.gappssmtp.com; s=20230601; t=1724442653; x=1725047453;
 darn=lists.sourceforge.net; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=GvDUOtqcbYcBaJm8eltM8LTQ5pM/0IWo4qbVFUFMhb8=;
 b=a6XU8w2KtBMXjr+fLRdGuWkptll+4P3mNI9WWQmJJyOuMmeLDKDT7x2LfEda2/vEge
 e2T9A9NpXyHEeLYvGXj7zNBYQo0Htdi4y56f9eV5H9Uo6KAwIp20FiK6tJW+cPaV3y+J
 2xLGOj+zUoSC0aLiK5+wjIcWSThg57OQxWaOl/OsvSrlY3VFFbb0my235XbtS5PoswGv
 M1BbZDNwBxYpItABcVQP5S3xgX2/KcSit/luq4MfqEnqiUmkNyUxxv4VKD1+zVfm55Ug
 0EH9jcbfGQWI2dSq6ua/NuABPO0Hzn847toCslAV1rvX3ZU9yzp8Q0xHIwN/pTPKR583
 cbDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724442653; x=1725047453;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GvDUOtqcbYcBaJm8eltM8LTQ5pM/0IWo4qbVFUFMhb8=;
 b=n2b3CM4pSkx2fyL7Hetgupqyk1ppo5UdIcL/SbJu5PCsrkbHsQNwWGt2hcb3+ceMpr
 /4sXuBrF+86iuVD5eP+xh3I37OPYQ4fSePI69Cb2GH6UoTsAHZH2thI7Ll1iBwR3S7/z
 79Zz2qO+Y15szCtJOD/O472Rq9UsToMmNNQDbX5Zsw+gg6LpJ4hsAFveR2yydDG6k6Co
 Y1Mccx7k1FeuTTU0EXkhbDhJVHR+yWNnHScok09eO28mrSUfD81hmkRRVSeRBGnTt/d8
 5n5engNu0varKJ2ZS5s6xMmkJH/4ziTXYhnH1o4ZcGJm8iWC2kW09yKm51xutA+Y5RZj
 rQ4Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWc8GpVMSo0UjAHFzru/9mEMQ/SntIFsPDUFzRH+CQusbCjuRsQdMO8FmVMYpK3Lcm2aNdjM9gRuV3pgokpxIq8@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxxBOQzxy233qyaqnyyUuqct12zbuNygAhzniNKT61qcBP3LB8Y
 LGs6X5i5S0WNaFUuUF/BX83bNzpObqy5D2kEG2IV0TuPiT5lUNmAKtUCp1tEQs0=
X-Google-Smtp-Source: AGHT+IH4qOLQPF2HPeO5TqFqGYEIwV4E0AAAjJEh0SIJO2HuyeRtTSkUJvREsKWLNYSeNG9LdY3NiA==
X-Received: by 2002:a05:690c:887:b0:652:e90f:cd15 with SMTP id
 00721157ae682-6c62601404amr39080987b3.25.1724442652925; 
 Fri, 23 Aug 2024 12:50:52 -0700 (PDT)
Received: from localhost (syn-076-182-020-124.res.spectrum.com.
 [76.182.20.124]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-6c39de3ea5asm6531627b3.130.2024.08.23.12.50.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Aug 2024 12:50:52 -0700 (PDT)
Date: Fri, 23 Aug 2024 15:50:51 -0400
From: Josef Bacik <josef@toxicpanda.com>
To: Li Zetao <lizetao1@huawei.com>
Message-ID: <20240823195051.GD2237731@perftesting>
References: <20240822013714.3278193-1-lizetao1@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240822013714.3278193-1-lizetao1@huawei.com>
X-Spam-Score: -5.0 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Aug 22, 2024 at 09:37:00AM +0800, Li Zetao wrote:
 > Hi all, > > In btrfs, because there are some interfaces that do not use
 folio, > there is page-folio-page mutual conversion. This patch set [...] 
 Content analysis details:   (-5.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.128.181 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.128.181 listed in bl.score.senderscore.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.181 listed in wl.mailspike.net]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [209.85.128.181 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1shaJG-0003jb-NA
Subject: Re: [f2fs-dev] [PATCH -next 00/14] btrfs: Cleaned up folio->page
 conversion
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
Cc: willy@infradead.org, linux-f2fs-devel@lists.sourceforge.net, clm@fb.com,
 terrelln@fb.com, dsterba@suse.com, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Aug 22, 2024 at 09:37:00AM +0800, Li Zetao wrote:
> Hi all,
> 
> In btrfs, because there are some interfaces that do not use folio,
> there is page-folio-page mutual conversion. This patch set should
> clean up folio-page conversion as much as possible and use folio
> directly to reduce invalid conversions.
> 
> This patch set starts with the rectification of function parameters,
> using folio as parameters directly. And some of those functions have
> already been converted to folio internally, so this part has little
> impact. 
> 
> I have tested with fsstress more than 10 hours, and no problems were
> found. For the convenience of reviewing, I try my best to only modify
> a single interface in each patch.
> 
> Josef also worked on converting pages to folios, and this patch set was
> inspired by him:
> https://lore.kernel.org/all/cover.1722022376.git.josef@toxicpanda.com/
> 

This looks good, I'm running it through the CI.  If that comes out clean then
I'll put my reviewed-by on it and push it to our for-next branch.  The CI run
can be seen here

https://github.com/btrfs/linux/actions/runs/10531503734

Don't worry if you see errors on the zoned run or the RST run, Johannes is
running down the RST stuff and I need to sit down and figure out what's going on
with zoned.  If anything else fails I'll look at it to see if it's legit or not.
Thanks,

Josef


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
