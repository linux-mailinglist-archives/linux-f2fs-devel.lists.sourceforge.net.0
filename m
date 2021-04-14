Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BC8E035FC74
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 14 Apr 2021 22:18:46 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lWlyB-0003Mz-BO; Wed, 14 Apr 2021 20:18:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <nickrterrell@gmail.com>)
 id 1lWly5-0003Lt-R5; Wed, 14 Apr 2021 20:18:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UG8735pzi/e9l1ZDZAEDgiio/ANWXateqqwK2vC/qMU=; b=HM6bZP4tq7n+pU7SFub0wJQ9ct
 XzIhrSE94jBtkLS1SvtltWJy/J36wdXgasfWMk7lr4BzBjl+Jen8vDDhQHYvM73gOzAKmumQcdJWO
 FReCaAeCmGOmZuWhGuvEV6Gf03GeJt/ElLEzcjwAq65jBIx5As6AoLiugs6mSqDDIzM4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UG8735pzi/e9l1ZDZAEDgiio/ANWXateqqwK2vC/qMU=; b=Cqh6u4IR49ryXutlOZrdXW7IlC
 XThtypCNHuHRQ5LkAOnCpoQ3u5fkzHNnMJZNw9+LT6OR3XCAK3kRD23KhBpXC66Ypo0vv0wvMKvBn
 IDGtycv100Xl3h1JF0al6gTJeDxi9+Q02OyWglMt5uvlxUTnUjKBoJwaTlpGfk87oVFw=;
Received: from mail-yb1-f179.google.com ([209.85.219.179])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1lWly2-0003iC-VI; Wed, 14 Apr 2021 20:18:33 +0000
Received: by mail-yb1-f179.google.com with SMTP id o10so23546063ybb.10;
 Wed, 14 Apr 2021 13:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UG8735pzi/e9l1ZDZAEDgiio/ANWXateqqwK2vC/qMU=;
 b=WOfcpWAhNcfvW+6AgEJE2nL5D05401ZkMXNqaPIlIHvaQxs+JRSH0hJTrVb4v1lQvL
 Iu52ljiPnD+Th8uOLIL94h1kDXuXjXtQ4EzdG/UUWHsJAnDATVrYCORsG+t0BOIfFnQJ
 4a0Isri564YbTGRgfutepJm3XOGJlX7XW+6and4twEu8JZFQwLaqn/W5hEYxsWMbIRsB
 fkO4QhgTtcTSS5uU87LXAgPPm/nSQ3j/CRqr5/8tw7RZpa0VKTxtH4ztAhKyDZKM01vB
 xWt6J+nkHPSBL57ABZmwXd1YkUnspCfFOuGgV/ZpxN4uyNdjxbP1SlEQli9eLwefh8kp
 XPYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UG8735pzi/e9l1ZDZAEDgiio/ANWXateqqwK2vC/qMU=;
 b=C0GsQxdYdUTS/6g39veSXTDRM4IpqgofhGXLisdM8noRes47+RVpFp75htYZOjyXnh
 b5WhnycvxCxfqNsFkNftWCOeT9oOoqkaxaoxSH4SYoLiZ7bwUiiPoGGH6N5Uam7rWzcn
 JESNFE+duIzQTdaH4xNkWH5oIlv/82xjhpZnj77NejAx2glpKl15FeiHAlyK2SzZiHU5
 uD6orNZ8c8gcVFQ1ZdoUXB2T1eBv/Ge41Y7IuyDddIhpwpUjLPrftyo69v5DBJCvXuef
 PBoxSPCYGGna0BT9IkMcHXDRJLW14mzkkgKXawf5sXS2ytv+9vgbaBnYgRUn2yJ9XKG/
 fiAA==
X-Gm-Message-State: AOAM533lQCf3gxuGGjdSlUcVG1XBeQgHZnaqRpB+4mvzaASglphID0us
 +mpTq9Ssl7VvEytoZHTd+/lJsJaq/5+rNbVcZg4=
X-Google-Smtp-Source: ABdhPJyose+gbonWMUZzbaW7vn6s/J4rN/R6C9yCnWMC3DCn3oypaR8mD/4T/wS/REILgWBcuJRKd++ZXEmbFRpRhcI=
X-Received: by 2002:a25:3056:: with SMTP id w83mr56777350ybw.381.1618431504003; 
 Wed, 14 Apr 2021 13:18:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210330225112.496213-1-nickrterrell@gmail.com>
 <CANr2DbfL2B5Tx+k1AwVh-5dQZ+fNpucJKu9QVQat7QVvK-5AbQ@mail.gmail.com>
 <CANr2DbfZ+fV+GN7CfDi1AFmfsdnX+kGnTA6kayEchtGwfoAE-A@mail.gmail.com>
 <YHc16rz4Y/PkzNH1@gmail.com>
 <CANr2Dbc+2rS7seuXGtU6Y+x0Qv+hrtwz71r+akKeQUXECZaJZA@mail.gmail.com>
 <YHc8xtmzKaazC6kP@gmail.com>
In-Reply-To: <YHc8xtmzKaazC6kP@gmail.com>
From: Nick Terrell <nickrterrell@gmail.com>
Date: Wed, 14 Apr 2021 13:18:13 -0700
Message-ID: <CANr2Dbfo09KCK7iAEEbOyPXHBtzB39s+QjUxKW_DbCHYJj+0sg@mail.gmail.com>
To: Eric Biggers <ebiggers@kernel.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (nickrterrell[at]gmail.com)
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.179 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.219.179 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1lWly2-0003iC-VI
Subject: Re: [f2fs-dev] [GIT PULL][PATCH v9 0/3] Update to zstd-1.4.10
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
Cc: squashfs-devel@lists.sourceforge.net,
 Herbert Xu <herbert@gondor.apana.org.au>, Yann Collet <cyan@fb.com>,
 =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
 Petr Malat <oss@malat.biz>, David Sterba <dsterba@suse.cz>,
 linux-kernel@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
 Chris Mason <clm@fb.com>, Nick Terrell <terrelln@fb.com>,
 linux-crypto@vger.kernel.org, Oleksandr Natalenko <oleksandr@natalenko.name>,
 Kernel Team <Kernel-team@fb.com>, linux-f2fs-devel@lists.sourceforge.net,
 Niket Agarwal <niketa@fb.com>, linux-btrfs@vger.kernel.org,
 Johannes Weiner <jweiner@fb.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Apr 14, 2021 at 12:04 PM Eric Biggers <ebiggers@kernel.org> wrote:
>
> On Wed, Apr 14, 2021 at 11:53:51AM -0700, Nick Terrell wrote:
> > On Wed, Apr 14, 2021 at 11:35 AM Eric Biggers <ebiggers@kernel.org> wrote:
> > >
> > > On Wed, Apr 14, 2021 at 11:01:29AM -0700, Nick Terrell wrote:
> > > > Hi all,
> > > >
> > > > I would really like to make some progress on this and get it merged.
> > > > This patchset offsers:
> > > > * 15-30% better decompression speed
> > > > * 3 years of zstd bug fixes and code improvements
> > > > * Allows us to import zstd directly from upstream so we don't fall 3
> > > > years out of date again
> > > >
> > > > Thanks,
> > > > Nick
> > > >
> > >
> > > I think it would help get it merged if someone actually volunteered to maintain
> > > it.  As-is there is no entry in MAINTAINERS for this code.
> >
> > I was discussing with Chris Mason about volunteering to maintain the
> > code myself.
> > We wanted to wait until this series got merged before going that
> > route, because there
> > was already a lot of comments about it, and I didn't want to appear to
> > be trying to bypass
> > any review or criticisms. But, please let me know what you think.
> >
>
> I expect that most people would like to see a commitment to maintain this code
> before merging.  The usual way to do that is to add a MAINTAINERS entry.
>
> Otherwise it is 27000 lines of code dumped on other people to maintain.

I will add a 4th patch in the series to update the MAINTAINERS.

> - Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
