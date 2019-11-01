Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D6EEC3B2
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  1 Nov 2019 14:32:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Message-ID:Date:In-Reply-To:References:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NJjC+eKp4AJAbVxc9TkJBwShGQAy9xo8E7X77VTIsTY=; b=fuMYYlzcyYBeW7YDly8NbjTO3T
	aTiye1Qi9WRKV/oep67tIVc6T29DZ7yASOjoDdeg+XPCYq9LmcSEUIviYXGj5SVnvXGV4xgoOArUs
	Y/cCf+d8LVgbtmqIe0Hlu/oZORy0F/ky/6qzpRQIoCeDcffwvPVZoMgPqtGkOdz1qHEA=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iQX2S-0003h9-E8; Fri, 01 Nov 2019 13:32:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <groeck@google.com>) id 1iQX2R-0003h2-6e
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 01 Nov 2019 13:32:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sIZwoSrU60azkju4XlI+xHq6n0ne1xWv7n1NGMPGr4Q=; b=XDJP2McmaZ1IvuDtF9ZWysxpG5
 6hVD+D+z6xZyevqbi+bXhM7LWLgi32Vu0sSOA/clJZ7lDv0wAJhP+exUnWJrVJI9tar9yDk7p5Ymj
 pqhhuZtKCb4q1Vx44RS859QUjYtwJE03SPPeKU6GnR09QgMHnCmxuohXklibcYsGGGSE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=sIZwoSrU60azkju4XlI+xHq6n0ne1xWv7n1NGMPGr4Q=; b=ElymDFDH6Bu9FhOWmcyV6/f2nT
 cqp/WZXsc/DfWVibdMSOLO9Ht9JpU+0bq2AfxTRn6yBYsgOz9e2HUZoULWQUPbK7jFgVF8POOeBhX
 SDFtSiHa31bLnvf3LW2Y85QVC4xtevz5Esi7TUCUuNAJ6+TU2uuEJr50WGJjKVPHwJcU=;
Received: from mail-yw1-f67.google.com ([209.85.161.67])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1iQX2N-00Dvl2-2O
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 01 Nov 2019 13:32:27 +0000
Received: by mail-yw1-f67.google.com with SMTP id s6so3473235ywe.5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 01 Nov 2019 06:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sIZwoSrU60azkju4XlI+xHq6n0ne1xWv7n1NGMPGr4Q=;
 b=NM8Ga8Hqnp8YUqkz1Huiro6k8teFHd041XtBeYc+Ya1GKfoTW8wtTa5320HyfTx7rs
 ev7ncEyqpJyIouMHVJA0ek6rI/99vnGXVojZD3zJgPS+/RINUhJa8x/Wjse7coSJGDFL
 Kd+MzCVqIarPT98omr9ob+2N52k+0IPD89iU1D4D3xcizwoU2TzITjgNAiaPY9bx2qhk
 1ytTybKexviQ3hI4p0Fp0dPqiL2jyyBG2+nxm+kXaZbqg5dfI/4MvoXZ6/hS8M9HQ5Vk
 EQcDv8rHP1RuZDL+kPZa18q6AYTCP4MiZCU6A1fBNdzAVaNwUVRsnDgBih47qRT2G45u
 m0qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sIZwoSrU60azkju4XlI+xHq6n0ne1xWv7n1NGMPGr4Q=;
 b=JeoWLXXYSijAeF1gHVHax7NHBgpp9Xq209AWIrluBoDBeDp/JeSDso1BlKRCsQEp+M
 NdLe2RUhXjEHGzM0Wij0biEWN5YmO7GObHfl3JM9i2f06XpvrXkG6NBqvogweYrftwT9
 op2Th/8d3QvLutNB9NyJLVTRz35Z2JEgrFj8UOviMYr503u8QfjiwiLaaJuLBKSC4lNn
 eyaM+/s6csSXS/puy7v5ZlsStbNYxCo/4Jg1xVqYH4tNTwxTt9ujEy+ApOkVq8fqPleP
 DFK/Rsy90IEWMd8AENbSBpS7l1ajFLk71Xe3LO4R2Z11tWPIJkMiMVUoRVhiX8WD13Fa
 HEcQ==
X-Gm-Message-State: APjAAAW4Z37TDNDG2sazGkjgOC0QUF8qeCORdwvTfrJIpV6f2/AEahdJ
 isK8481MSlUOVGfhQDvx8rHDa0dIcFwftDo/DY0FUA==
X-Google-Smtp-Source: APXvYqzyWIQ58WDy4QVlh+4flLK1JIVIkiZK2lzx8SHEsEX/KtyBRcjNp3P7bwbxQfGmLusYD0py4wwrMtjR50NGH9k=
X-Received: by 2002:a81:8486:: with SMTP id u128mr8278300ywf.337.1572615136623; 
 Fri, 01 Nov 2019 06:32:16 -0700 (PDT)
MIME-Version: 1.0
References: <20191030100618.1.Ibf7a996e4a58e84f11eec910938cfc3f9159c5de@changeid>
 <20191030173758.GC693@sol.localdomain>
 <CAD=FV=Uzma+eSGG1S1Aq6s3QdMNh4J-c=g-5uhB=0XBtkAawcA@mail.gmail.com>
 <20191030190226.GD693@sol.localdomain>
 <20191030205745.GA216218@sol.localdomain>
 <CAD=FV=X6Q3QZaND-tfYr9mf-KYMeKFmJDca3ee-i9roWj+GHsQ@mail.gmail.com>
 <CAD=FV=URZX4t-TB2Ne8y5ZfeBGoyhsPZhcncQ0yPe3cRXi=1gw@mail.gmail.com>
 <20191101043620.GA703@sol.localdomain>
In-Reply-To: <20191101043620.GA703@sol.localdomain>
Date: Fri, 1 Nov 2019 06:32:05 -0700
Message-ID: <CABXOdTf=x_LGExsBUnqEvT4t=OAp3e3YjpEDCGdeQnKR=5=D5A@mail.gmail.com>
To: Eric Biggers <ebiggers@kernel.org>
X-Spam-Score: -15.6 (---------------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.161.67 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.161.67 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -7.5 USER_IN_DEF_SPF_WL     From: address is in the default SPF white-list
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.5 ENV_AND_HDR_SPF_MATCH  Env and Hdr From used in default SPF WL Match
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
X-Headers-End: 1iQX2N-00Dvl2-2O
Subject: Re: [f2fs-dev] [PATCH] Revert "ext4 crypto: fix to check feature
 status before get policy"
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
From: Guenter Roeck via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Guenter Roeck <groeck@google.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Gwendal Grignou <gwendal@chromium.org>,
 linux-ext4 <linux-ext4@vger.kernel.org>,
 Ryo Hashimoto <hashimoto@chromium.org>, linux-doc@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, Doug Anderson <dianders@chromium.org>,
 linux-f2fs-devel@lists.sourceforge.net,
 Vadim Sukhomlinov <sukhomlinov@google.com>, linux-fscrypt@vger.kernel.org,
 Andreas Dilger <adilger.kernel@dilger.ca>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Guenter Roeck <groeck@chromium.org>, "Theodore Y. Ts'o" <tytso@mit.edu>,
 Andrey Pronin <apronin@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Oct 31, 2019 at 9:36 PM Eric Biggers <ebiggers@kernel.org> wrote:
>
> On Thu, Oct 31, 2019 at 10:52:19AM -0700, Doug Anderson wrote:
> > Hi,
> >
> > On Wed, Oct 30, 2019 at 2:59 PM Doug Anderson <dianders@chromium.org> wrote:
> > >
> > > Hi,
> > >
> > > On Wed, Oct 30, 2019 at 1:57 PM Eric Biggers <ebiggers@kernel.org> wrote:
> > > >
> > > > FWIW, from reading the Chrome OS code, I think the code you linked to isn't
> > > > where the breakage actually is.  I think it's actually at
> > > > https://chromium.googlesource.com/chromiumos/platform2/+/refs/heads/master/chromeos-common-script/share/chromeos-common.sh#375
> > > > ... where an init script is using the error message printed by 'e4crypt
> > > > get_policy' to decide whether to add -O encrypt to the filesystem or not.
> > > >
> > > > It really should check instead:
> > > >
> > > >         [ -e /sys/fs/ext4/features/encryption ]
> > >
> > > OK, I filed <https://crbug.com/1019939> and CCed all the people listed
> > > in the cryptohome "OWNERS" file.  Hopefully one of them can pick this
> > > up as a general cleanup.  Thanks!
> >
> > Just to follow-up: I did a quick test here to see if I could fix
> > "chromeos-common.sh" as you suggested.  Then I got rid of the Revert
> > and tried to login.  No joy.
> >
> > Digging a little deeper, the ext4_dir_encryption_supported() function
> > is called in two places:
> > * chromeos-install
> > * chromeos_startup
> >
> > In my test case I had a machine that I'd already logged into (on a
> > previous kernel version) and I was trying to log into it a second
> > time.  Thus there's no way that chromeos-install could be involved.
> > Looking at chromeos_startup:
> >
> > https://chromium.googlesource.com/chromiumos/platform2/+/refs/heads/master/init/chromeos_startup
> >
> > ...the function is only used for setting up the "encrypted stateful"
> > partition.  That wasn't where my failure was.  My failure was with
> > logging in AKA with cryptohome.  Thus I think it's plausible that my
> > original commit message pointing at cryptohome may have been correct.
> > It's possible that there were _also_ problems with encrypted stateful
> > that I wasn't noticing, but if so they were not the only problems.
> >
> > It still may be wise to make Chrome OS use different tests, but it
> > might not be quite as simple as hoped...
> >
>
> Ah, I think I found it:
>
> https://chromium.googlesource.com/chromiumos/overlays/chromiumos-overlay/+/2cbdedd5eca0a57d9596671a99da5fab8e60722b/sys-apps/upstart/files/upstart-1.2-dircrypto.patch
>
> The init process does EXT4_IOC_GET_ENCRYPTION_POLICY on /, and if the error is
> EOPNOTSUPP, it skips creating the "dircrypto" keyring.  So then cryptohome can't
> add keys later.  (Note the error message you got, "Error adding dircrypto key".)
>

Good catch. I'll try replacing that with a check for the sysfs flag
and see if that does the trick.

Guenter

> So it looks like the kernel patch broke both that and
> ext4_dir_encryption_supported().
>
> I don't see how it could have broken cryptohome by itself, since AFAICS
> cryptohome only uses EXT4_IOC_GET_ENCRYPTION_POLICY on the partition which is
> supposed to have the 'encrypt' feature set.
>
> - Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
