Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 44BAB95D86A
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 23 Aug 2024 23:21:36 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1shbir-0006pi-Nz;
	Fri, 23 Aug 2024 21:21:29 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <josef@toxicpanda.com>) id 1shbio-0006pb-N3
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 23 Aug 2024 21:21:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Gi+GBk0V0rBcUQPo7AU1pZEz+s/atBLn1ZFAE3KtYfY=; b=ekJoEQbON3kUtjCmYnc9qHNFwC
 XrEI9bc0k9YiwSVzvB0IT/hWqW2Go/h+zYpmz33KxQrgdk34Kp1kvKgyKMo08k87iKpbHeKlBEAvn
 psrEnhQoqXpwgqDeSzYqPi+FSnePrtwsrgVGwDntJTGpYxJZ7C/FgLtxupA/gsh8c1Vs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Gi+GBk0V0rBcUQPo7AU1pZEz+s/atBLn1ZFAE3KtYfY=; b=PA2JIyL/m0niISjOPzjSP+tAd1
 W76TqP9I4hiuquYUeAyNFiYWcrVbn4TSAiebZDfpC/OpyulU6WJQcNCO8hsNpC7hWb4bqEbkoX5LE
 HehWw1SKPOPacOsfxPhudED+o1tBpfD+z9xA3suUh/NKelWQMSfruKFJI7rMl1CGj8F8=;
Received: from mail-pg1-f173.google.com ([209.85.215.173])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1shbim-0000l2-GA for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 23 Aug 2024 21:21:26 +0000
Received: by mail-pg1-f173.google.com with SMTP id
 41be03b00d2f7-7cd8803fe0aso1653091a12.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 23 Aug 2024 14:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=toxicpanda-com.20230601.gappssmtp.com; s=20230601; t=1724448078; x=1725052878;
 darn=lists.sourceforge.net; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Gi+GBk0V0rBcUQPo7AU1pZEz+s/atBLn1ZFAE3KtYfY=;
 b=SfSbqmwUMMm+HHiucKFApfCfwTvewEQ60X83mKXRH5USlvnnJMcRHEVUvJLz5P8AUb
 xE3b5+aiVQ4XF6gQeOjJIoTHxtpwqw0kEqSigKMUg9Bugf6569IfFORnQG+A6VGh5MBR
 B6rLt8ryWMFvDDpQ3fsnPWBlolgcwi9wWDiamhRy3tGCk572vN2pX6iUQsRfq/VtGmuV
 uZuEHZKyOgdDpVC3aHtUT8WNcPH0HWPmx3IodLdZWFje4NrlQmgayDKkqK+yJNAppTVX
 Gggb3LDY+XfBzrXIcCg8r3syArm4lZ36iVkKpfkF4+V7Lh0IV7Rk+ATsGRmdk45o7vg3
 kqGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724448078; x=1725052878;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Gi+GBk0V0rBcUQPo7AU1pZEz+s/atBLn1ZFAE3KtYfY=;
 b=cGL/6s3cILENE05oIaL/DGAsqx0wAtJUdG/b4HItbigga/s4vNhFtAUfSwBufe+A1x
 gHkBTTosIwUWRiaHOt7lmmeyshtXDVgFyS2KaPIYGvVv7aDO5drBqB1pbhqL5ehUzz2S
 E0kFpEgO8C+ncbR8vQKiRV9imsNeDumG3byn3/3FTvykXxQj/KetX5Vb0da/wzi/aN+Y
 sP6cFgcaXJlSz1+h93vGdqXPD8fP45RaKgWSCCw4FpWyAourMDeWsPDKCo/dytQuxcLt
 7nYtBQgC4R0UCQcnnAYgSf8oC6U2tnQGykOs9QY2KDDLFVaA35YXuOW7ZU8ua0GXu0CK
 RulQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0KArVWVePr80YqoLxEovgomwuQAH+LDv+mk7g+NVcIPEHbQOOY84Csiu4vgHOMBVXAA2JgUZ3BMIvj7wnnUMJ@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxlOelW8aUVQ1n1lCTxExkRo0NVACV7bLDoSN4PbWiD4OXO/bI4
 Vjxhx/i20mjf1wdwVijl6c9LxnRmhPZ1zR+wsgBbhbHtn22Isy4drTfSHeBMLC+cVDZgbE2glUR
 S
X-Google-Smtp-Source: AGHT+IE3KtCby39IHktlYafbomlwtEyUUr/AIpkQ2sYkPsbADMRf6kyiWjTwgrV/3qLf8qmowosXDg==
X-Received: by 2002:a05:6902:230d:b0:e11:82fb:70c with SMTP id
 3f1490d57ef6-e17a868246emr3830292276.51.1724447724327; 
 Fri, 23 Aug 2024 14:15:24 -0700 (PDT)
Received: from localhost (syn-076-182-020-124.res.spectrum.com.
 [76.182.20.124]) by smtp.gmail.com with ESMTPSA id
 3f1490d57ef6-e178e4b365csm834285276.27.2024.08.23.14.15.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Aug 2024 14:15:23 -0700 (PDT)
Date: Fri, 23 Aug 2024 17:15:22 -0400
From: Josef Bacik <josef@toxicpanda.com>
To: Li Zetao <lizetao1@huawei.com>
Message-ID: <20240823211522.GA2305223@perftesting>
References: <20240822013714.3278193-1-lizetao1@huawei.com>
 <20240823195051.GD2237731@perftesting>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240823195051.GD2237731@perftesting>
X-Spam-Score: -5.0 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Aug 23, 2024 at 03:50:51PM -0400, Josef Bacik wrote:
 > On Thu, Aug 22, 2024 at 09:37:00AM +0800, Li Zetao wrote: > > Hi all, >
 > > > In btrfs, because there are some interfaces that do not use [...] 
 Content analysis details:   (-5.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [209.85.215.173 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.173 listed in wl.mailspike.net]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.215.173 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.215.173 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1shbim-0000l2-GA
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

On Fri, Aug 23, 2024 at 03:50:51PM -0400, Josef Bacik wrote:
> On Thu, Aug 22, 2024 at 09:37:00AM +0800, Li Zetao wrote:
> > Hi all,
> > 
> > In btrfs, because there are some interfaces that do not use folio,
> > there is page-folio-page mutual conversion. This patch set should
> > clean up folio-page conversion as much as possible and use folio
> > directly to reduce invalid conversions.
> > 
> > This patch set starts with the rectification of function parameters,
> > using folio as parameters directly. And some of those functions have
> > already been converted to folio internally, so this part has little
> > impact. 
> > 
> > I have tested with fsstress more than 10 hours, and no problems were
> > found. For the convenience of reviewing, I try my best to only modify
> > a single interface in each patch.
> > 
> > Josef also worked on converting pages to folios, and this patch set was
> > inspired by him:
> > https://lore.kernel.org/all/cover.1722022376.git.josef@toxicpanda.com/
> > 
> 
> This looks good, I'm running it through the CI.  If that comes out clean then
> I'll put my reviewed-by on it and push it to our for-next branch.  The CI run
> can be seen here
> 
> https://github.com/btrfs/linux/actions/runs/10531503734
> 

Looks like the compression stuff panic'ed, the run has to finish before it
collects the dmesg so IDK where it failed yet, but I'd go over the compression
stuff again to see if you can spot it.  When the whole run finishes there will
be test artifacts you can get to.  If you don't have permissions (I honestly
don't know how the artifacts permission stuff works) then no worries, I'll grab
it in the morning and send you the test and dmesg of what fell over.  Thanks,

Josef


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
