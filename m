Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D4433A3BE0
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 30 Aug 2019 18:24:10 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1i3jh2-0006Jk-RU; Fri, 30 Aug 2019 16:24:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <arndbergmann@gmail.com>)
 id 1i3jh1-0006JN-Db; Fri, 30 Aug 2019 16:24:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=B6+OAXXxl2dEgnQY4Uq2+qZqkvaxmBKnbK7dC2TYwZ0=; b=OhQPs0V0RNpNmAir9+sCa8+XjA
 8FPvHbzUDPU7FZB4Lzh8TyjOMbxHbe6UDfnaxheQSTRAPOXJr8VI1Br6EfbwHWHdIkKjv/V8KESb3
 ki+/v7yx9Rlsp64EJ3YhL53RiqFrFVIo0e4NKfuqzVkKa4YP3pmI9fwk9PGYoCLwJs9c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=B6+OAXXxl2dEgnQY4Uq2+qZqkvaxmBKnbK7dC2TYwZ0=; b=GbPT+0RPjicG5XMFqzmKElh+sn
 WTT07I9kCpniUHG3+a5NhRaN0LDjBeLWEoQAW7K8TU5lSMmPwq6k/NvsB/02tFOAKxTW17ZnTZJyT
 6pcA6R/vUiyOUtHWHRF38Z0Ra99Asb1G/K1H7PwSdCPfUIA5aX+yIUgG5o7FG9A4ixIo=;
Received: from mail-qt1-f194.google.com ([209.85.160.194])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 id 1i3jh0-003Z8g-17; Fri, 30 Aug 2019 16:24:07 +0000
Received: by mail-qt1-f194.google.com with SMTP id i4so8178869qtj.8;
 Fri, 30 Aug 2019 09:24:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=B6+OAXXxl2dEgnQY4Uq2+qZqkvaxmBKnbK7dC2TYwZ0=;
 b=kxlC1xR4jSPXW9SLdnh9Ue/smlFpaUNTWXYoLDfv/bW1OpP8BeGMjeLaYMGTr2lj9X
 zWjg4yelpSW9yBBbLLBFrB0peMkEXBZA5H6Vu8itzsflaplSaN+zh9eVCsvkKlFlwi44
 92aDaCivWBjBWrGEYjSpYBheCznWuphgJNgF52Lb9QEM7nZywmYMwRgRo6EdNssRJ+PS
 NXjhyDgAFM+7zHx7MGEjRuVwWicEkzQrJyRDMhuG38ODfTGnPk+D++5u1Bdd81B84c1Z
 10wKt/xd53+pM+k5Qm3b/nMmLtSORjjVFw2a3XHCP2rsH7IS+xiWTgBOalThBNDocATz
 pCeg==
X-Gm-Message-State: APjAAAVRKGFe7EdkSeyRPo5+PPp1pipLkNfxLCc9oCMFhcCReArCqmBX
 wngKdkkt5nuYu6pvh1oIP9VxUhitYUQ950pfnyw=
X-Google-Smtp-Source: APXvYqx1Qvswft0K3BgJsYOtSdZQVwjHx2AQF9skYad3Rr5MY9B9bcWDDXL/X1Cpj9GrJMiBQ1QnvNUru+BTr0FLkYc=
X-Received: by 2002:ac8:5306:: with SMTP id t6mr2652509qtn.204.1567182239864; 
 Fri, 30 Aug 2019 09:23:59 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a1XjOMpuS12Xao1xqOLFOuz1Jb8dTAfrhLcE643sSkC5g@mail.gmail.com>
 <20190830154744.4868-1-deepa.kernel@gmail.com>
In-Reply-To: <20190830154744.4868-1-deepa.kernel@gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 30 Aug 2019 18:23:43 +0200
Message-ID: <CAK8P3a3WUmeewmNscdKpUf3fB3eLV1X=YdLQt8cvS_tqq7OroQ@mail.gmail.com>
To: Deepa Dinamani <deepa.kernel@gmail.com>
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (arndbergmann[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.160.194 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.160.194 listed in wl.mailspike.net]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.2 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and EnvelopeFrom
 freemail headers are different
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1i3jh0-003Z8g-17
Subject: Re: [f2fs-dev] [GIT PULL RESEND] vfs: Add support for timestamp
 limits
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
Cc: Latchesar Ionkov <lucho@ionkov.net>,
 Martin Brandenburg <martin@omnibond.com>, jfs-discussion@lists.sourceforge.net,
 Dave Kleikamp <shaggy@kernel.org>, Anders Larsen <al@alarsen.net>,
 Bob Copeland <me@bobcopeland.com>, Adrian Hunter <adrian.hunter@intel.com>,
 linux-mtd <linux-mtd@lists.infradead.org>, mikulas@artax.karlin.mff.cuni.cz,
 Christoph Hellwig <hch@lst.de>, Nicolas Pitre <nico@fluxnic.net>,
 Mike Marshall <hubcap@omnibond.com>, linux-cifs@vger.kernel.org,
 Zheng Yan <zyan@redhat.com>, Sage Weil <sage@redhat.com>,
 "Darrick J. Wong" <darrick.wong@oracle.com>,
 y2038 Mailman List <y2038@lists.linaro.org>,
 Richard Weinberger <richard@nod.at>, Steve French <sfrench@samba.org>,
 Anton Vorontsov <anton@enomsg.org>,
 Russell King - ARM Linux <linux@armlinux.org.uk>, codalist@coda.cs.cmu.edu,
 Christoph Hellwig <hch@infradead.org>, coda@cs.cmu.edu,
 V9FS Developers <v9fs-developer@lists.sourceforge.net>,
 Ilya Dryomov <idryomov@gmail.com>,
 Ext4 Developers List <linux-ext4@vger.kernel.org>, salah.triki@gmail.com,
 asmadeus@codewreck.org, devel@lists.orangefs.org,
 Evgeniy Dushistov <dushistov@mail.ru>, Kees Cook <keescook@chromium.org>,
 Eric Van Hensbergen <ericvh@gmail.com>, Jan Kara <jack@suse.com>,
 reiserfs-devel@vger.kernel.org, Tejun Heo <tj@kernel.org>,
 Al Viro <viro@zeniv.linux.org.uk>, aivazian.tigran@gmail.com,
 David Sterba <dsterba@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 ceph-devel <ceph-devel@vger.kernel.org>, trond.myklebust@hammerspace.com,
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
 Andreas Dilger <adilger@dilger.ca>, Jan Harkes <jaharkes@cs.cmu.edu>,
 Linux NFS Mailing List <linux-nfs@vger.kernel.org>,
 Tony Luck <tony.luck@intel.com>, Theodore Ts'o <tytso@mit.edu>,
 Luis de Bethencourt <luisbg@kernel.org>,
 Artem Bityutskiy <dedekind1@gmail.com>, linux-ntfs-dev@lists.sourceforge.net,
 gregkh <gregkh@linuxfoundation.org>, linux-karma-devel@lists.sourceforge.net,
 Jeff Layton <jlayton@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Linux F2FS DEV,
 Mailing List" <linux-f2fs-devel@lists.sourceforge.net>,
 linux-xfs <linux-xfs@vger.kernel.org>, Colin Cross <ccross@android.com>,
 Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>,
 phillip@squashfs.org.uk, David Woodhouse <dwmw2@infradead.org>,
 "Anna.Schumaker@Netapp.com" <anna.schumaker@netapp.com>,
 Joel Becker <jlbec@evilplan.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Aug 30, 2019 at 5:48 PM Deepa Dinamani <deepa.kernel@gmail.com> wrote:
>
> [resending, rebased onto linux v5.3-rc6, and dropped orangefs patch from the series]
>
> Hi Al, Arnd,
>
> This is a pull request for filling in min and max timestamps for filesystems.
> I've added all the acks, and dropped the adfs patch. That will be merged through
> Russell's tree.
>
> Dropped orangefs until the maintainers decide what its limits should be.

I've merged this into my
git://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git y2038
branch. Since you did not include a tag description, I took the text from
the last patch series as the commit text, with a link to the pull request
on lore.kernel.org.

Al, let me know in case you have any objections to this going through
the y2038 branch, and you would rather take it through vfs.git.

     Arnd


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
