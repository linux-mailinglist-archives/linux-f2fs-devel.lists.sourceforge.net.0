Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4E05F1319
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 30 Sep 2022 22:02:06 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oeMCh-0002pd-RQ;
	Fri, 30 Sep 2022 20:02:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1oeMCg-0002pX-F0
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 30 Sep 2022 20:01:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fHw5bthHkZ6wVmpLXXlxKzX4awvmiLNTfGvvpOnBM54=; b=ZuBKZpYg+mS3UGccSjx09uVYhh
 8YkpzxsUB6Y8xMMYxvGcWL4QWCZ50iOXjWm0hWdqOXRiy28dRqHftRDmYQD1JR+rLyV7vKYc2tQ/g
 nXVEKg2K9A9ZgBGTwPQYHbvkJLxMu597UQwKxmXdc7MmKR6247alQKPWU4/zpDkGBLKo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fHw5bthHkZ6wVmpLXXlxKzX4awvmiLNTfGvvpOnBM54=; b=g5rZ7VNFFU3vcHgH2Ens090OSG
 TW6Tw8wHfyCSJRqPdoLw/f0QaFz6jnXwVb34wqdEy958tk/2+uCrsVqelM3qteZxY39xNpZZCJcl5
 pFGaKUChojmb24/BamI28zxUgFbcE2qJFwB6yxrAw/hdInVf66aJtNlvVQyuKjzI+TmE=;
Received: from mail-yw1-f181.google.com ([209.85.128.181])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1oeMCo-000808-KX for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 30 Sep 2022 20:01:58 +0000
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-333a4a5d495so54240387b3.10
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 30 Sep 2022 13:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=fHw5bthHkZ6wVmpLXXlxKzX4awvmiLNTfGvvpOnBM54=;
 b=i0eKJXZV7PNaL5CKCGGCLZHqCiIHNgG3V5nkz1Q0kfRN2gINoeslisnPK53cEJTbdB
 CiRwPUtD6MgLXUC4cqlsW16i4l71U6c+YG8G4SgeA+GpEvJWu2E5DT/0cf4CG0NEtpzo
 6UZKjO5t/G1MWSt6PgcaFVhlsDWJsvvpq8J73DIGGzEIbHTAGJle3TFRmgBlHQuxWqNp
 OmnRTXUvdIg+zG3x+yBdk5HUqMODaPvPjEHkWiLEPQmIRvkBpTNl1E080zbWS9bkuA4G
 rD/xbANuIssEuiH53YaGbuw0K4ouPbLt0fq1s+DjYBSWnRjwXaaLwdSAr0cLLTZZ4fAr
 F3dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=fHw5bthHkZ6wVmpLXXlxKzX4awvmiLNTfGvvpOnBM54=;
 b=cSoaliCEmFB9A5i+YlOlKQy9zi4cd+6kocBmgHezURUH7M6Y2IlBSK96qT21fNxyQT
 U3PTpzdH722xkEcwZpC93t/QJHqSXyhGOgycxoykU87AXisSBLeVXI5b56nIxdW6rHgi
 +GxNNP6W+itP1xc89Yr6nypDAHW+NjlJQfi/f8E6t0xMCDNM1Xf1BfsqRqRSeF44X8I9
 TFesKMyYWBZ/9OAFL4fAmIafT9PX3bEdnq43Dj5cYvbj7PsZQnnIbYO+326BN1zPZrwz
 KHVCTIOQ+ILk9Maqp4m3YVz+4k06R+Qf4+B+X21TzWchZ7w9jMXkAQxdIcOxcEP0FjsV
 PM7g==
X-Gm-Message-State: ACrzQf2KgTfJ0yH9S61+BTOckiTjtTGrknZPnLS2t8KG8ZEj/jgtHCGk
 lYnta0GP07E4L4IBLNJ5zyxvLYiwCYPMT+/xLww=
X-Google-Smtp-Source: AMsMyM5KIlevA693ocjInV1CEQU3ztoIk5GG/H6QPUNePLEzde8O6y4OzyTFwxR55yBMM2FoY4qcSAVrQoqRF72vP7E=
X-Received: by 2002:a81:9ca:0:b0:354:fce9:814b with SMTP id
 193-20020a8109ca000000b00354fce9814bmr9625750ywj.458.1664568108388; Fri, 30
 Sep 2022 13:01:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220920014036.2295853-1-daeho43@gmail.com>
 <f4ce9486-f104-b0e2-25ed-f6de96316b76@kernel.org>
 <CACOAw_z=9H6jEQNd8C99c6xO55PJXWJOW7Q=78qtppgysebN2A@mail.gmail.com>
 <4aca0d00-d3b7-975f-6b72-ccd6f07d22e5@kernel.org>
 <CACOAw_wVU1gmH1gyWHYNqCpgy4KGKB+EZK6pbGL-h_1ToDV=vg@mail.gmail.com>
 <53df1b78-c611-6a22-88b1-74cc83a9e148@kernel.org>
 <CACOAw_w_09sz8PxnSGzNmJwh1-y_3JoKbBu80VjgZgV1uxo7KA@mail.gmail.com>
In-Reply-To: <CACOAw_w_09sz8PxnSGzNmJwh1-y_3JoKbBu80VjgZgV1uxo7KA@mail.gmail.com>
From: Daeho Jeong <daeho43@gmail.com>
Date: Fri, 30 Sep 2022 13:01:37 -0700
Message-ID: <CACOAw_wjcFr1fg3QRYPUyOGyo-G9D9U6=qprkPUP8PzoxPQkMQ@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Sep 30, 2022 at 9:04 AM Daeho Jeong wrote: > > > >>>>
 > > >>>> Hi Daeho, > > >>>> > > >>>> isize should be updated after tagging
 inode as atomic_write one? > > >>>> otherwise f2fs_mark_inode [...] 
 Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [daeho43[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [daeho43[at]gmail.com]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.181 listed in wl.mailspike.net]
X-Headers-End: 1oeMCo-000808-KX
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: introduce
 F2FS_IOC_START_ATOMIC_REPLACE
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
Cc: Daeho Jeong <daehojeong@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Sep 30, 2022 at 9:04 AM Daeho Jeong <daeho43@gmail.com> wrote:
>
> > >>>>
> > >>>> Hi Daeho,
> > >>>>
> > >>>> isize should be updated after tagging inode as atomic_write one?
> > >>>> otherwise f2fs_mark_inode_dirty_sync() may update isize to inode page,
> > >>>> latter checkpoint may persist that change? IIUC...
> > >>>>
> > >>>> Thanks,
> > >>>
> > >>> Hi Chao,
> > >>>
> > >>> The first patch of this patchset prevents the inode page from being
> > >>> updated as dirty for atomic file cases.
> > >>> Is there any other chances for the inode page to be marked as dirty?
> > >>
> > >> I mean:
> > >>
> > >> Thread A                                Thread B
> > >> - f2fs_ioc_start_atomic_write
> > >>    - f2fs_i_size_write(inode, 0)
> > >>     - f2fs_mark_inode_dirty_sync
> > >>                                          - checkpoint
> > >>                                           - persist inode with incorrect zero isize
> > >>
> > >>    - set_inode_flag(inode, FI_ATOMIC_FILE)
> > >>
> > >> Am I missing something?
> > >>
> > >
> > > So, f2fs_mark_inode_dirty_sync() will not work for atomic files
> > > anymore, which means it doesn't make the inode dirty.
> > > Plz, refer to the first patch of this patchset. Or I might be confused
> > > with something. :(
> >
> > I mean FI_ATOMIC_FILE was set after f2fs_i_size_write(), so inode will be set
> > as dirty.
> >
> > Thanks,
> >
>
> Oh, I was confused that f2fs_update_inode() is called in
> f2fs_mark_inode_dirty_sync().
> That is called in f2fs_write_inode(). Let me fix this.

Hmm, I think the issue was already there before my patch.
So, how about making the inode flushed and clean if the inode is
already dirty when starting atomic write?

>
> Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
