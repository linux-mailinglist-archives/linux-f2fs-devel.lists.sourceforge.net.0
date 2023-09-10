Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 22CD879A082
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 11 Sep 2023 00:01:52 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qfSUw-0007Sy-Kr;
	Sun, 10 Sep 2023 22:01:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <david@fromorbit.com>) id 1qfSUv-0007Sr-3l
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 10 Sep 2023 22:01:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EyybjuBSw2AsBAibBPVqGccWs6P0JtTeGBB0Kwx90Dw=; b=GxLS9Ez5aG8cq6OyoELCyx27aC
 wN715ueMmesRMFX/+TgNwyqjJxrSCIK8p2dsFple1v1tKVLOlMj6oJeOgIttxbY/4L7bxJmBZI3CT
 snH6YrtcIxJUiBNzlci92XUuIncGNQvjqn5OCw4xN6DIo88mIJBsvyDOsOVwk7ArpSvA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=EyybjuBSw2AsBAibBPVqGccWs6P0JtTeGBB0Kwx90Dw=; b=KEN3StVPFEpC/qxznygayb3Zxn
 raPKHdLxtFnzdzr8fzoOgKUy5F/KxCW6A4/qtiSEorhN6t3F3WhRfw4i/Ug2V0yfEdvoqzSIAWcQI
 /F4ty7bK3j7g6xAyNB5/nbAH0nmWsKt9y1fzznUWa8jB5uZgx/lHQhE0kruQC/hKOPl4=;
Received: from mail-pf1-f173.google.com ([209.85.210.173])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qfSUn-00H6OD-ES for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 10 Sep 2023 22:01:39 +0000
Received: by mail-pf1-f173.google.com with SMTP id
 d2e1a72fcca58-68fb6fd2836so844474b3a.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 10 Sep 2023 15:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fromorbit-com.20230601.gappssmtp.com; s=20230601; t=1694383288; x=1694988088;
 darn=lists.sourceforge.net; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=EyybjuBSw2AsBAibBPVqGccWs6P0JtTeGBB0Kwx90Dw=;
 b=JYBnUClFEwwWETTtpWatD63J5oKDWJ0ovBYfCA03V9iG5tk6+R3gDGrNqao3Gt5ndK
 ZfM2jnvnWUlf6LJn97bnwx/vEN4XkvR55bn8DqOU95W9/j/LhPxRdON+nF/tSmhtjFAn
 xpSKJodqydi+tTlg/E3+AqqurVs1fBUf9I/xOID6+YoenOyRbkJre/U49QrPwRfuSbaq
 CHoiibwzTDv09x/wbPGbx+ZClmOwZtXTfk3F/hAh5eUGjujFOP2F57OeR0PqnUjtZZqL
 HGj6gx7r43mXgNpAUoAOj5aEAS1qzSMhAIgDBQZjUMzGfh4ATZd3l9YEcGGmZghfj7Kk
 XfIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694383288; x=1694988088;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EyybjuBSw2AsBAibBPVqGccWs6P0JtTeGBB0Kwx90Dw=;
 b=IHDs34FSI2b45HbF7i8jm+9jHiRdKd+PBMeKvjDDayFGec5kZUsJIWn7IhQnHw3RD/
 CpIlBRg3UVXyzHzKUjeIt9fkpYXQReV4xX1dfULnkprv3Xc5Nq8yuqimtdGvtl9WmIdM
 IZxhIWuN/ArcgCKQ9WS5lfago6Ggoe4KCGmP72eT4FeHhjwugTI4MNaLIh/UdzrEwt9E
 J5RKHl6wtl81+iB+w14VnAoiJO/hPrsxUMRKTuZvRK1Un/DDIba814HY8G7uIE9C69P5
 E/U0Ho+yGQZNZLPAPc3PyKa/oGeu5jc8o8HfqE8YqEET8JyPb2uDlXd/2tKMZoXqcfWM
 vR3g==
X-Gm-Message-State: AOJu0YwSJv/DVMq+FKSMVLH6mjnIQ32itzfh9Po17QjaQjxPPRoqzEOP
 CtYI7Lr4Z9MNinfQR3wxRWqNCg==
X-Google-Smtp-Source: AGHT+IHSYFPf3w2qdTZr9bikkzuSsvPYQjYYZyW+Zfc616rQWXs3Eeo2BzwinmhhOfJVOtnHj1lBTA==
X-Received: by 2002:a05:6a00:1a0c:b0:68c:57c7:1eb0 with SMTP id
 g12-20020a056a001a0c00b0068c57c71eb0mr9371853pfv.11.1694383287795; 
 Sun, 10 Sep 2023 15:01:27 -0700 (PDT)
Received: from dread.disaster.area (pa49-195-66-88.pa.nsw.optusnet.com.au.
 [49.195.66.88]) by smtp.gmail.com with ESMTPSA id
 u10-20020a62ed0a000000b0068a3dd6c1dasm4403641pfh.142.2023.09.10.15.01.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Sep 2023 15:01:27 -0700 (PDT)
Received: from dave by dread.disaster.area with local (Exim 4.96)
 (envelope-from <david@fromorbit.com>) id 1qfSUe-00DWBA-0u;
 Mon, 11 Sep 2023 08:01:24 +1000
Date: Mon, 11 Sep 2023 08:01:24 +1000
To: Pavel Begunkov <asml.silence@gmail.com>
Message-ID: <ZP48tAg2iS0UzKQf@dread.disaster.area>
References: <20230827132835.1373581-1-hao.xu@linux.dev>
 <20230827132835.1373581-8-hao.xu@linux.dev>
 <ZOvA5DJDZN0FRymp@casper.infradead.org>
 <c728bf3f-d9db-4865-8473-058b26c11c06@linux.dev>
 <ZO3cI+DkotHQo3md@casper.infradead.org>
 <642de4e6-801d-fcad-a7ce-bfc6dec3b6e5@linux.dev>
 <ZPUJHAKzxvXiEDYA@dread.disaster.area>
 <6489b8cb-7d54-1e29-f192-a3449ed87fa1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6489b8cb-7d54-1e29-f192-a3449ed87fa1@gmail.com>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Sep 08, 2023 at 01:29:55AM +0100,
 Pavel Begunkov wrote:
 > On 9/3/23 23:30, Dave Chinner wrote: > > On Wed, Aug 30, 2023 at 02:11:31PM
 +0800, Hao Xu wrote: > > > On 8/29/23 19:53, Matthew Wilco [...] 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.173 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.173 listed in list.dnswl.org]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1qfSUn-00H6OD-ES
Subject: Re: [f2fs-dev] [PATCH 07/11] vfs: add nowait parameter for
 file_accessed()
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
From: Dave Chinner via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Dave Chinner <david@fromorbit.com>
Cc: Wanpeng Li <wanpengli@tencent.com>, "Darrick J . Wong" <djwong@kernel.org>,
 Dominique Martinet <asmadeus@codewreck.org>, linux-unionfs@vger.kernel.org,
 linux-mm@kvack.org, Stefan Roesch <shr@fb.com>, Clay Harris <bugs@claycon.org>,
 linux-s390@vger.kernel.org, linux-nilfs@vger.kernel.org,
 Matthew Wilcox <willy@infradead.org>, codalist@coda.cs.cmu.edu,
 cluster-devel@redhat.com, linux-cachefs@redhat.com, linux-ext4@vger.kernel.org,
 Hao Xu <hao.xu@linux.dev>, linux-cifs@vger.kernel.org,
 ecryptfs@vger.kernel.org, linux-nfs@vger.kernel.org,
 linux-block@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 io-uring@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
 Christian Brauner <brauner@kernel.org>, netdev@vger.kernel.org,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 devel@lists.orangefs.org, linux-fsdevel@vger.kernel.org,
 linux-mtd@lists.infradead.org, bpf@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Sep 08, 2023 at 01:29:55AM +0100, Pavel Begunkov wrote:
> On 9/3/23 23:30, Dave Chinner wrote:
> > On Wed, Aug 30, 2023 at 02:11:31PM +0800, Hao Xu wrote:
> > > On 8/29/23 19:53, Matthew Wilcox wrote:
> > > > On Tue, Aug 29, 2023 at 03:46:13PM +0800, Hao Xu wrote:
> > > > > On 8/28/23 05:32, Matthew Wilcox wrote:
> > > > > > On Sun, Aug 27, 2023 at 09:28:31PM +0800, Hao Xu wrote:
> > > > > > > From: Hao Xu <howeyxu@tencent.com>
> > > > > > > 
> > > > > > > Add a boolean parameter for file_accessed() to support nowait semantics.
> > > > > > > Currently it is true only with io_uring as its initial caller.
> > > > > > 
> > > > > > So why do we need to do this as part of this series?  Apparently it
> > > > > > hasn't caused any problems for filemap_read().
> > > > > > 
> > > > > 
> > > > > We need this parameter to indicate if nowait semantics should be enforced in
> > > > > touch_atime(), There are locks and maybe IOs in it.
> > > > 
> > > > That's not my point.  We currently call file_accessed() and
> > > > touch_atime() for nowait reads and nowait writes.  You haven't done
> > > > anything to fix those.
> > > > 
> > > > I suspect you can trim this patchset down significantly by avoiding
> > > > fixing the file_accessed() problem.  And then come back with a later
> > > > patchset that fixes it for all nowait i/o.  Or do a separate prep series
> > > 
> > > I'm ok to do that.
> > > 
> > > > first that fixes it for the existing nowait users, and then a second
> > > > series to do all the directory stuff.
> > > > 
> > > > I'd do the first thing.  Just ignore the problem.  Directory atime
> > > > updates cause I/O so rarely that you can afford to ignore it.  Almost
> > > > everyone uses relatime or nodiratime.
> > > 
> > > Hi Matthew,
> > > The previous discussion shows this does cause issues in real
> > > producations: https://lore.kernel.org/io-uring/2785f009-2ebb-028d-8250-d5f3a30510f0@gmail.com/#:~:text=fwiw%2C%20we%27ve%20just%20recently%20had%20similar%20problems%20with%20io_uring%20read/write
> > > 
> > 
> > Then separate it out into it's own patch set so we can have a
> > discussion on the merits of requiring using noatime, relatime or
> > lazytime for really latency sensitive IO applications. Changing code
> > is not always the right solution...
> 
> Separation sounds reasonable, but it can hardly be said that only
> latency sensitive apps would care about >1s nowait/async submission
> delays. Presumably, btrfs can improve on that, but it still looks
> like it's perfectly legit for filesystems do heavy stuff in
> timestamping like waiting for IO. Right?

Yes, it is, no-one is denying that. And some filesystems are worse
than others, but none of that means it has to be fixed so getdents
can be converted to NOWAIT semantics.

ie. this patchset is about the getdents NOWAIT machinery, and
fiddling around with timestamps has much, much wider scope than just
NOWAIT getdents machinery. We'll have this discussion about NOWAIT
timestamp updates when a RFC is proposed to address the wider
problem of how timestamp updates should behave in NOWAIT context.

-Dave.
-- 
Dave Chinner
david@fromorbit.com


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
