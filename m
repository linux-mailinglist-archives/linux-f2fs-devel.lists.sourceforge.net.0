Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A91667AF60
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 25 Jan 2023 11:11:34 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pKckd-0002ep-GV;
	Wed, 25 Jan 2023 10:11:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <glider@google.com>) id 1pKckb-0002ej-Sl
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 25 Jan 2023 10:11:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5SeUJhAbfU72yemE0E0j1G7piTXH1F7KntUn7UYBddU=; b=O84AEBJPFY8s8+FVEZZumkauSy
 laCneyjUMVod0gNVgzCMczs0S1/HzJ2zglXWhEI+bRxeyltZlp5Yp7V8+UK53qBftgFXbBkfH5uq8
 lsZKVuPJnmPbyts2CtBJ709mUPpbxZFWdRYW4vw8wruAtPQmudKWffjRO/cyrg7QyXt0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5SeUJhAbfU72yemE0E0j1G7piTXH1F7KntUn7UYBddU=; b=UcDZzz1Cn6fWpR4eLfnuTy1NL8
 ewbXAVYBTShxWftp5n7VevOPVyvC73QSypJj+qjlh6VgbUXkwTdi/KxIO99ZSysUjvPRy+MXN+v7e
 tqU87a9ffktr4S2K2FGqezTsBpdp+Grr1s3zA89OD2PaYahHsys9y0ob4Zd4qqQITfYY=;
Received: from mail-io1-f44.google.com ([209.85.166.44])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pKckX-0003yn-6p for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 25 Jan 2023 10:11:28 +0000
Received: by mail-io1-f44.google.com with SMTP id j1so8253901iob.6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 25 Jan 2023 02:11:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5SeUJhAbfU72yemE0E0j1G7piTXH1F7KntUn7UYBddU=;
 b=n82yTyq60gfB7ZBTcbC47BjG7Tytwup5QkbDjOCyYW+pS+3OfxGwgnZFTABB/LqcGZ
 7tVrStGLiZqVVpfbWnbaTbpvptVnM+Nu8sYeHLTWIVvUMx8Mx0cOWiRicmCtvT22ntQM
 QatXbUnE5o+8UFv2vFRx2/Ug9/Kmo2gKyhABplKcWjhAe+Uq1QnflpzrQzKMiU1JLnB/
 8zYBwHUqvms2mOcaT0U68C5JKkEObDM3xvgkUgwLT5rR+RJ1rm9ymk2g8OI0VEgLCY0O
 u+8uIzx2vAnCFTK5d2N2GWZCPbk5y+LoO273DLxKY517CgTyfXdW6O5D9v5WijsKfc6G
 qesg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5SeUJhAbfU72yemE0E0j1G7piTXH1F7KntUn7UYBddU=;
 b=Jc6t4m1uLCSTxYYJfugxL7VFfBW3ij7Yx+vMQkTulE2zvQnSvc9d0A5LtqzQppXcmr
 GazItfXvNnDqZh5cD0nD9qKALLomZEsPVpjEMQCRsKI+PRZj3QraUSscKOQXa3lvebbg
 y7LoGCc6kQkDL3OqbLT5elsDolf/R42u8rWP70bt6w0c7PfjVOuY9/RCbk0UoP9aE7WN
 N9MizfVR0HjxYCzN/wGtt5Z+XV6vhOVmV4/CxnOLz6sPgYsBW70J/SNjC2dE8StL0FDR
 pASf0ggWmJol/MTQIyagZRIgMlvHCABEs4uh3fr02H+0q1p5WMQDqG1hQ1/1+4wPXFCb
 /3AQ==
X-Gm-Message-State: AFqh2kod1zMx20pM0gnP9PNxqH7D1U4fSvuUU7Co94i9U2FS2C0RSaEH
 rs6MKsHTXevzhcOyV40g4PYPdfFc2DInIiPG+HJzwA==
X-Google-Smtp-Source: AMrXdXtr6x7bYmEm3e0aUlWGo2ZpD49VFa3T/OLaI5NXGvDzxuAP39ygszlGpkz6AcbCjewz+os3jpGlAoIReMKipzo=
X-Received: by 2002:a05:6602:42c7:b0:6e2:f126:6c1f with SMTP id
 ce7-20020a05660242c700b006e2f1266c1fmr2792945iob.1.1674641479393; Wed, 25 Jan
 2023 02:11:19 -0800 (PST)
MIME-Version: 1.0
References: <20230123070414.138052-1-ebiggers@kernel.org>
 <CAG_fn=VNjkRMozdcQUSMTHvMQ26SG45oisxamJbEVrg2m41ngg@mail.gmail.com>
 <Y87PqGgw1uJVlnrP@gmail.com>
In-Reply-To: <Y87PqGgw1uJVlnrP@gmail.com>
Date: Wed, 25 Jan 2023 11:10:43 +0100
Message-ID: <CAG_fn=VRgtSfN30HK2kpJMRvz3utrzbiXUJ+c1-_D5RX-_UUyg@mail.gmail.com>
To: Eric Biggers <ebiggers@kernel.org>
X-Spam-Score: -15.7 (---------------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  > > Out of curiosity, did you add any extra annotations to
 detect uninit > > writes to the disk? > > No. This is the report I got: >
 > [ 145.280969] =================================================== [...]
 Content analysis details:   (-15.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM
 welcome-list
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.44 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.44 listed in wl.mailspike.net]
 -7.5 USER_IN_DEF_SPF_WL     From: address is in the default SPF
 welcome-list
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.5 ENV_AND_HDR_SPF_MATCH  Env and Hdr From used in default SPF WL
 Match
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1pKckX-0003yn-6p
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix information leak in
 f2fs_move_inline_dirents()
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
From: Alexander Potapenko via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Alexander Potapenko <glider@google.com>
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

> > Out of curiosity, did you add any extra annotations to detect uninit
> > writes to the disk?
>
> No.  This is the report I got:
>
> [  145.280969] =====================================================
> [  145.285368] BUG: KMSAN: uninit-value in virtqueue_add+0x1ba5/0x6ac0

Oh cool, nice to see these are actually working :)


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
