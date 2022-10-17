Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C353601437
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 17 Oct 2022 19:03:52 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1okTWm-0003Wz-5k;
	Mon, 17 Oct 2022 17:03:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1okTWk-0003Wt-GH
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 17 Oct 2022 17:03:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1gM2OhPkZ6+CVHU/B6ywYxdhbtgkPzENmTLQaUuvjkI=; b=EcMya9qkwSYb3IHHR1bEj0hMJx
 xDVGvanws0WkqEh9hNEzdebaCn//nx4MRAfGx6NdW/iG/XqBzYmT3/KzbZ6TPCfYKVZTEUm6M753E
 kXhYaMXWwlkrxmo3UEYa5tHKP4UdiMPBmkHdP/tS/ypsSxeDn1ISj5R21ChiyK2CV/Jk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1gM2OhPkZ6+CVHU/B6ywYxdhbtgkPzENmTLQaUuvjkI=; b=BMiRDjSNxbKtfQuuYFJlljo4hp
 6b95Cs9yf3O1A7B7mxlCGS6TRvGtatxqtAVsxsGoUYP3tSvXgM2jIIyzwQSU7uejqL7IUeB1+MycA
 hFj328lh8skHXjwpc+3O9IaaYARucEx8kx54Mh9I31AuTEChRViq8yGTcinBP6uBkqoA=;
Received: from mail-yb1-f182.google.com ([209.85.219.182])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1okTWj-007CyY-Vt for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 17 Oct 2022 17:03:46 +0000
Received: by mail-yb1-f182.google.com with SMTP id 207so14025366ybn.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 17 Oct 2022 10:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=1gM2OhPkZ6+CVHU/B6ywYxdhbtgkPzENmTLQaUuvjkI=;
 b=cZIQgpIJQMIYS77HywyT+t1No+jvE3iaIWeu9auSgMVTDDkiouT8bS/VE8qSdKT0d7
 ozM1qOetOvplkyukd+qBZxkr/6vTKMLKt7PUFZzF/0LCSQHtLqKu5MUsdgH10hWpnr5H
 4/21CuM9XyiM5QgBk5Pp9GqrpY9PRRieeJiUIRxWRp7TuGZFuZQwQagPv4ryPCsPHnX1
 4wD+30MmtV04vpLsPmjY3pKLq/Zf8T2tiTmjy4yG9kNZBHlfdfx9oD/GIOqhEf73Mq8l
 5rFU4v0nBIdfCVPGcf705WrSo4Xh9xFKZ1WgzZ4Xpr+uTaAxmPkQzptZWZrdjJUwm+I6
 80DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1gM2OhPkZ6+CVHU/B6ywYxdhbtgkPzENmTLQaUuvjkI=;
 b=CuufoleK93gWvGHgy9zY3d+bULC/nP7I1MUpLz08MTgYvhHop69cM22lv10H9AwyEA
 TwnQg4OUo1ti+c3WwiGqj1RYckGXE1yx+AwKln/kgHAcO1x8W58kP4X74z+crh34hvbG
 CebGrVNmEAV8aj7biLx6qopbuYR+lYToKXwzdzbtoCIDv5BTOfVWFe2ZnbiIoVgdF1oF
 uaUAAh8TEJO+qo1HfKRDVK/e01v+ElDSzM6+TWSwN4B5jl18gmXyLMqKzTDv2J1A8hv1
 jqCOcU4RCEMJFOc2GTALgzP+ow4zeV2k0DjZKaQbgakvCRrjONqg8mcciumHsfZny/Ao
 UBxA==
X-Gm-Message-State: ACrzQf0RgV6vBTqUjGHWgSJakBXh7rPjgiSJuLdOBqJuFtOMIqeVOdId
 21ck0Ih9iEm2Pfsshnb+l5rue2w0lVWZTHsbV0A=
X-Google-Smtp-Source: AMsMyM54HWiafe2uq2dl3gt7Md5lNHao++4/jaAzrj0jQke8Zcm1vzvnTP8vRn3Now7tETxpKUpDojnpfnywgJIOW7A=
X-Received: by 2002:a05:6902:1186:b0:6c1:653a:ba74 with SMTP id
 m6-20020a056902118600b006c1653aba74mr10104010ybu.546.1666026220102; Mon, 17
 Oct 2022 10:03:40 -0700 (PDT)
MIME-Version: 1.0
References: <20221004171351.3678194-1-daeho43@gmail.com>
 <20221004171351.3678194-2-daeho43@gmail.com>
 <Yz6S3kP4rjm5/30N@infradead.org> <Yz8DJROpwCcNyxVX@magnolia>
In-Reply-To: <Yz8DJROpwCcNyxVX@magnolia>
From: Daeho Jeong <daeho43@gmail.com>
Date: Mon, 17 Oct 2022 10:03:29 -0700
Message-ID: <CACOAw_z61txMMH+5Pq+4LS5hmC9rbvHaEiY5-V-M9mq56Tx6yg@mail.gmail.com>
To: "Darrick J. Wong" <djwong@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Oct 6, 2022 at 9:32 AM Darrick J. Wong wrote: > >
 On Thu, Oct 06, 2022 at 01:33:34AM -0700, Christoph Hellwig wrote: > > On
 Tue, Oct 04, 2022 at 10:13:51AM -0700, Daeho Jeong wrote: > > > Fr [...] 
 Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.219.182 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [daeho43[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [daeho43[at]gmail.com]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.182 listed in wl.mailspike.net]
X-Headers-End: 1okTWj-007CyY-Vt
Subject: Re: [f2fs-dev] [PATCH v4 2/2] f2fs: introduce
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
Cc: Daeho Jeong <daehojeong@google.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Christoph Hellwig <hch@infradead.org>,
 linux-fsdevel@vger.kernel.org, kernel-team@android.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Oct 6, 2022 at 9:32 AM Darrick J. Wong <djwong@kernel.org> wrote:
>
> On Thu, Oct 06, 2022 at 01:33:34AM -0700, Christoph Hellwig wrote:
> > On Tue, Oct 04, 2022 at 10:13:51AM -0700, Daeho Jeong wrote:
> > > From: Daeho Jeong <daehojeong@google.com>
> > >
> > > introduce a new ioctl to replace the whole content of a file atomically,
> > > which means it induces truncate and content update at the same time.
> > > We can start it with F2FS_IOC_START_ATOMIC_REPLACE and complete it with
> > > F2FS_IOC_COMMIT_ATOMIC_WRITE. Or abort it with
> > > F2FS_IOC_ABORT_ATOMIC_WRITE.
> >
> > It would be great to Cc Darrick and linux-fsdevel as there have been
> > attempts to do this properly at the VFS level instead of a completely
> > undocumented ioctl.
>
> It's been a while since I sent the last RFC, but yes, it's still in my
> queue as part of the xfs online fsck patchserieses.
>
> https://lore.kernel.org/linux-fsdevel/161723932606.3149451.12366114306150243052.stgit@magnolia/
>
> More recent git branch:
> https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git/log/?h=atomic-file-updates

Hi,

It's a very interesting suggestion and we might use this in F2FS someday.
However, I think it's not exactly matched for what
F2FS_IOC_START_ATOMIC_REPLACE is doing now.

Thanks for bringing my attention to this.

>
> --D


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
