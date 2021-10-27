Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8529543D104
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 27 Oct 2021 20:45:42 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mfnvb-0000Jk-QM; Wed, 27 Oct 2021 18:45:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <daeho43@gmail.com>) id 1mfnva-0000Jd-A2
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 27 Oct 2021 18:45:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qA/KGY3jUxUtYWT2WGNI33Dl6A0vyDSF7oCZ6oQZ9Os=; b=edvxDQsNri78xfqZRKHeq6py+2
 fEC9y+u/MkZ5MK6Owg2+8FNrBDG4kJCR1zJ/PLe2O1Y4dF2BswBCIt+DE1Aqv8Ilz6ip18uJi0Ftk
 j18lOfRPgjUhpjAr0KFg9OSALvxZGr6yFAPP+tsKHcH6Xfeg0JiJdwte9ullCfNK1SE8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qA/KGY3jUxUtYWT2WGNI33Dl6A0vyDSF7oCZ6oQZ9Os=; b=ahUfCXzaNbqFJK3T5PZFu2EjWA
 ooqh+neyhl+XUYa+FPiGLK+LPLWGMhlKMkmCdV0s0eqDABqhAKIzSer38TmRgrng7qKTIGKqotege
 wogc4hT6EM2sgwZBmUvKqtUmW55J8bYSTvq7Xl4Gfg0fo40Xqc/2aAI0QCWZyuFfuQ2Q=;
Received: from mail-wr1-f47.google.com ([209.85.221.47])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1mfnvV-0006NI-9w
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 27 Oct 2021 18:45:34 +0000
Received: by mail-wr1-f47.google.com with SMTP id g7so4689571wrb.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 27 Oct 2021 11:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qA/KGY3jUxUtYWT2WGNI33Dl6A0vyDSF7oCZ6oQZ9Os=;
 b=fMxfuniLnTqucFG0YhxpsugZFF/eJGNK4ZbX4LY9fEmRxdrJbT5w9lcfOs7LN+GXYf
 Hsx6bj8CmeNqESGg6NbYAimJq36WEV/JIaMRB2Ckqs2ytl39CZvDv9m2AJKRIituY0lp
 BDPRE/K5+XlaNuf+SAkqOwHQc8/5O11g4fTLVvllUF81QMfItFbrRb9AQGv5BZUTs73k
 F1hYAQs9FhR88FWOY7IAQo3YmuIHw+w1HJ55DpUdmQrKuF5Z+1iCO8UPDc0KMSl0IJ7l
 PDXENdnLnYQzqGxeLyKbfrQShwbEWbcVnGtviIgv68LasTuItoDmHgwTxwck5gg06Fc5
 crjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qA/KGY3jUxUtYWT2WGNI33Dl6A0vyDSF7oCZ6oQZ9Os=;
 b=8Bz8ksZc4BjcaPEg6jswalPwRkb9s1/PnV6gzdZB7a95KlZr1o3gRrdoIzBFwZBPmG
 sLW1KV4vFHhz5xfAaNvV4BXZqqO5iQCY7ZYmWQNKM/MJuUCqBQ5by7ZC2p4FMYYFM7HS
 QVfAk5vVj1raNB5pAyWDWJQjZ1MeVBHd/57DpFjXJvv9j/MVvE9em9upfwJ+tM7w5WiQ
 jmeSLf4fzAbjdK4tVIT502nFoeirrWrJwa5n9100yYxTTkWuEaia0IqPOHq9O93OMQSQ
 yEpX4le83A/e4Q6u2xcA9Fe8/V5u3MS3GHUS1jv8sVqa0asNdFNatKgIObu6fOy5rwP3
 Fu9g==
X-Gm-Message-State: AOAM532GifS2pyULqvnOSWF10JeJdLc7U1UVGpjM+w9YSMRwQsjaYuHE
 oIAef/U4KCBXdUeFB/3avSFU64VsD8Q3LXyuxdBI/9G9
X-Google-Smtp-Source: ABdhPJz6z1AB2KkYkrn9DQFR11S9FAusCTB03d1ao1978U2t3UfKq0TIyj9mlJaVtpofCkNSyVTvTJkmUblgZk6NAL4=
X-Received: by 2002:a2e:960c:: with SMTP id v12mr34402683ljh.344.1635359812899; 
 Wed, 27 Oct 2021 11:36:52 -0700 (PDT)
MIME-Version: 1.0
References: <20211014190503.717830-1-daeho43@gmail.com>
 <e8b106fb-2878-2fa9-788f-965eef179a85@kernel.org>
 <CACOAw_yupuz+Xx-z9V0UaExuARHd8H9rruWCa2yj5-mgkeuUtQ@mail.gmail.com>
 <3ddb4013-8d63-7c00-6fdd-1f21752bd60c@kernel.org>
 <CACOAw_wjhr8j=-qEDHP_H+_7cTh_ep7Wix4=JC+5x5zp-zpUFA@mail.gmail.com>
 <c93106ef-b567-b973-7241-ea2fcef84855@kernel.org>
 <CACOAw_xOOcoTCYnxtSq9Sqn0aUvt=F_6UgUwWeh9RkS5Oj-RDg@mail.gmail.com>
In-Reply-To: <CACOAw_xOOcoTCYnxtSq9Sqn0aUvt=F_6UgUwWeh9RkS5Oj-RDg@mail.gmail.com>
From: Daeho Jeong <daeho43@gmail.com>
Date: Wed, 27 Oct 2021 11:36:41 -0700
Message-ID: <CACOAw_xunxNZz9zNHOJgLzWsGRnKHvpum5+kkizrx8pKCtgqaw@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Oct 26, 2021 at 10:56 AM Daeho Jeong wrote: > > >
 Yes, I doubt the problem may also happen in f2fs_evict_inode() with below
 > > callpath: > > > > - evict_inode > > - dquot_initialize failed [...] 
 Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [daeho43[at]gmail.com]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [daeho43[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.221.47 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.47 listed in wl.mailspike.net]
X-Headers-End: 1mfnvV-0006NI-9w
Subject: Re: [f2fs-dev] [PATCH] f2fs: remove circular locking between
 sb_internal and fs_reclaim
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

On Tue, Oct 26, 2021 at 10:56 AM Daeho Jeong <daeho43@gmail.com> wrote:
>
> > Yes, I doubt the problem may also happen in f2fs_evict_inode() with below
> > callpath:
> >
> > - evict_inode
> >   - dquot_initialize failed
> >   - sb_start_intwrite
> >   - f2fs_truncate
> >    - dquot_initialize lock dqio_sem
> >
> > How about this?
> >
>
> Got it~
> Then we need this in both f2fs_evict_inode() and f2fs_drop_inode().
>

It turns out this deadlock issue was related to the Android kernel only. :(
That was related to one of Android tracepoints, which triggered
internal memory reclaim inside of it.
We made a workaround for that in Android kernel.

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
