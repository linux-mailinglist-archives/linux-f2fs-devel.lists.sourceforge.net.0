Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D2A9A4F08F3
	for <lists+linux-f2fs-devel@lfdr.de>; Sun,  3 Apr 2022 13:14:53 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nayBy-00026e-Dz; Sun, 03 Apr 2022 11:14:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <sedat.dilek@gmail.com>)
 id 1nayBq-00026O-Hf; Sun, 03 Apr 2022 11:14:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 Reply-To:In-Reply-To:References:MIME-Version:Sender:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=473YRKNtbTeAAGTBhSk1AVQTddgdw5/IzzZpTy938xk=; b=LTccactl4NM9YVPEciD9htPcx3
 SY1U0zWHaGZyV3X9w5KRZRYPkYjU6+xDI+SK9P/AZW9lLo/sI4Bt0g+w/Qk2ojUYVY2WOK3yTkj9+
 gQTaFRCj8RBkaTASc2qDFMryLGLVeB0DmZi1P4P/7oSZyYEqcissIgLnrgoFs1M+rNXg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:Reply-To:In-Reply-To:
 References:MIME-Version:Sender:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=473YRKNtbTeAAGTBhSk1AVQTddgdw5/IzzZpTy938xk=; b=kBg6q0O9XxBx0jiFqOjp9G/Aww
 zIfsxSanYqC7MbJ3M11PNhXm1iy5eMOqTmlxUHbslJ6HbLidbs07UN1bjTiBwpt4gl6GBh4hmKxxR
 bnBWAv0au4gZzGnFEIw2owqRBvSerF1uTEBrvfgwMltqRku2OBiMm117S+P0Yqmr9pUc=;
Received: from mail-io1-f43.google.com ([209.85.166.43])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nayBo-003sJ3-9M; Sun, 03 Apr 2022 11:14:36 +0000
Received: by mail-io1-f43.google.com with SMTP id 125so8078529iov.10;
 Sun, 03 Apr 2022 04:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=473YRKNtbTeAAGTBhSk1AVQTddgdw5/IzzZpTy938xk=;
 b=JZ2LGUQyg7n2LEqDZsVb6FmhZIPR7Jdek4r8n842gjkZASB7sS8wnmwjmPX6dgy7cL
 467zHcPNlx5DqYRG7Eowna1rJcAXyDq7Ofa11wUklq0aLRqKV32JgRSjs/MrhKhKGMPM
 lwY2fgzwsCJEE+iELTq5pjEKvxwEBfFZOWRDGpOYsOoc5KMIfnqPKgjTeu55Y7W+bTbr
 +UpjEWvs/mg5j60fpTZZ1fYdWiRq7l84DZtpiCTs4n/qKbwB6UNgvc8XvaOoCvxeyRLa
 rJ415+7mX8Xw6z4H61nnES07M/oEP5zxV8BUE5EEkoXK4yrupRJULdUkneglvsOCUDJv
 Wmuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=473YRKNtbTeAAGTBhSk1AVQTddgdw5/IzzZpTy938xk=;
 b=LRzJUkXuASiQ4wJYeGXKRf7zs4JbHZRxxplbq8X469AGNVrWoSuBg0vywXw3gpfSSV
 RzaM7HkiY/G5etQD143pm31OtwPbMa5BQ9jYClaMTAbhpBlHEFy3Xk5PAgELIYt4vUKQ
 dE0LZ4piD0AZwbZfwVHMHHIHJZpnPEgE/4zVMlMA1Qb4Cu2hdnQE0eMFqhYY5bOVe/Qz
 oN+ZyxFfyCKPClSARiFmTrwIElVTBQhoUf+daub2fijTIiWRh0E5NyYQWN2jn1ZyQqDf
 QL5D0TxtB9Pzd1sG3jrx58T/eUehiJw1EJU1q/XrvoX9QKAvh6H5fIEjgQE/i9ado/gT
 XOKA==
X-Gm-Message-State: AOAM533FvssLUScAhKOoZbO4qQtoF2qmVihC+3nwdDo+yMP1gpRapDxd
 iraARJHOZA/2/9v1NH44djNwt3kjycShhJkDla8=
X-Google-Smtp-Source: ABdhPJyigFmotORseRB/b8BQWndmvWIBzrUBHBUJ/2qOYqi2gKeJCYwJDOskmLysypbS1a3/+xHnb1zHZwhcjtVTfJ4=
X-Received: by 2002:a05:6638:a3a:b0:323:5c6d:ae20 with SMTP id
 26-20020a0566380a3a00b003235c6dae20mr9792787jao.80.1648984470523; Sun, 03 Apr
 2022 04:14:30 -0700 (PDT)
MIME-Version: 1.0
References: <20211109013058.22224-1-nickrterrell@gmail.com>
 <CA+icZUX0t1TzLm_XFEG50pZi_u901TcXP4CZspk6VRUw26vYNQ@mail.gmail.com>
 <EBEC67C0-1CB9-4B24-A114-42F52071F04B@fb.com>
 <CA+icZUXsjZyajW=pusRxhMYcLm3MgMZg_aHpkc_QFbHAeLzoVg@mail.gmail.com>
In-Reply-To: <CA+icZUXsjZyajW=pusRxhMYcLm3MgMZg_aHpkc_QFbHAeLzoVg@mail.gmail.com>
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Sun, 3 Apr 2022 13:13:54 +0200
Message-ID: <CA+icZUXNxNiKCqbC6+RcO+dLZMd-thOGpNBwnFsqGw3f81ztjQ@mail.gmail.com>
To: Nick Terrell <terrelln@fb.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Mar 2, 2022 at 11:31 PM Sedat Dilek wrote: [ CC Peter
 Pentchev (Debian libzstd maintainer) ] [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [sedat.dilek[at]gmail.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.43 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.43 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1nayBo-003sJ3-9M
Subject: Re: [f2fs-dev] [GIT PULL] zstd changes for v5.16
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
Reply-To: sedat.dilek@gmail.com
Cc: Oleksandr Natalenko <oleksandr@natalenko.name>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Tom Seewald <tseewald@gmail.com>, Chris Mason <clm@fb.com>,
 Jean-Denis Girard <jd.girard@sysnux.pf>,
 Stephen Rothwell <sfr@canb.auug.org.au>, Paul Jones <paul@pauljones.id.au>,
 Nick Terrell <nickrterrell@gmail.com>, Yann Collet <cyan@fb.com>,
 Christoph Hellwig <hch@infradead.org>, Kernel Team <Kernel-team@fb.com>,
 Eric Biggers <ebiggers@kernel.org>,
 "squashfs-devel@lists.sourceforge.net" <squashfs-devel@lists.sourceforge.net>,
 =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
 Randy Dunlap <rdunlap@infradead.org>, David Sterba <dsterba@suse.cz>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>, Petr Malat <oss@malat.biz>,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 Felix Handte <felixh@fb.com>, Linus Torvalds <torvalds@linux-foundation.org>,
 Peter Pentchev <roam@debian.org>, Btrfs BTRFS <linux-btrfs@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Mar 2, 2022 at 11:31 PM Sedat Dilek <sedat.dilek@gmail.com> wrote:

[ CC Peter Pentchev (Debian libzstd maintainer) ]

[...]

> I wanted to request a version bump to 1.4.10 via Debian's reportbug tool.

Debian now ships ZSTD (libzstd) v1.4.10 in their unstable repository.

- Sedat -

[1] https://metadata.ftp-master.debian.org/changelogs//main/libz/libzstd/libzstd_1.4.10+dfsg-1_changelog


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
