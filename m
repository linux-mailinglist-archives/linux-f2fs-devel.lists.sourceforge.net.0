Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE7C4FC6A2
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 11 Apr 2022 23:20:58 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ne1Sw-0000VG-KB; Mon, 11 Apr 2022 21:20:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1ne1Sv-0000VA-4E
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 11 Apr 2022 21:20:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wVlj//Uk2r+zFhzKKcNvkzy0UWBQjwnW21bSyTNY+uw=; b=SNzmmPPZ/mH2KyG0+zVO8ejGtv
 Y6yp82g+BeQXV7gdssr2uOQp/HX4XQIsyeZ0Y/axo3UKuM9e0C1IoIULvX3ojoYolswIyO4oAIVqY
 jvTn0ocYezxkMQjSL3TfEFr2wvCYqoYa8/vfaHV+8wdU2Bcp0e2Yv191fNp+26AH+sK8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wVlj//Uk2r+zFhzKKcNvkzy0UWBQjwnW21bSyTNY+uw=; b=cHqJi+06w1s5g78QUqjxVrIImR
 h6FgnKy0qAQ1naY9qHnslxVckC6DCecCG1PXjtwq4WVF4csAAOGVheiuYPs93mPOkio3ZOPVtNceE
 JaIAgc4muDH1qX65xPho6ANkxeamll5r6nB1W9L5I12glq27yWbqzA0kWAYj81/1cRH0=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1ne1Ss-0008Ej-2p
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 11 Apr 2022 21:20:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 68DA56169F;
 Mon, 11 Apr 2022 21:20:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AEE5C385A3;
 Mon, 11 Apr 2022 21:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649712043;
 bh=VcMY/lkJl6v3hVQXFaFT0pm0LPne9KUAFAaE6uCrta0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gU4CC3bzYJkTVyk5PqY3DOzknRj13nibImxJjft8FbJbyS+aLxlVtUwOON/Po4SJ8
 1Nnj4WqU27WloPkpnT4RsEw7Pg+Rywitynfvqajwo5azIlfgkTvpOaJ3D2G/K135xf
 08Hc9/hizjG+MWuzpeYgtVElI4IIOkrGhttw5/dBjT3iDUxdfFvYxEKZ9gTsC37iuN
 9bF0E3aSAbXTZkwhJt27n2ic8fUT7psT32uuWFV/hkAPLSxtnxAicvNSXH/8pGSJri
 QB0MaD/DOcNZiy4eMJos4MO8DNmO6+zVJvWs+mDADGKXFsjhOo3yKuj2DfWALgFPqs
 C1ToNl9rNCKHA==
Date: Mon, 11 Apr 2022 14:20:41 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <YlSbqay8y6oaCxR6@google.com>
References: <20220401071909.505086-1-yuyufen@huawei.com>
 <20220401071909.505086-5-yuyufen@huawei.com>
 <0c134e0e-b2d0-0bc0-42fc-cd220ff77e72@kernel.org>
 <25a24259-3ac3-81ab-1c28-f2a4886888b5@huawei.com>
 <778b1f04-a71b-a226-f7a7-4833fc9bf7c2@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <778b1f04-a71b-a226-f7a7-4833fc9bf7c2@kernel.org>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 04/11, Chao Yu wrote: > On 2022/4/6 11:01, Yufen Yu via
 Linux-f2fs-devel wrote: > > Hi, > > > > On 2022/4/1 16:28, Chao Yu wrote:
 > > > On 2022/4/1 15:19, Yufen Yu via Linux-f2fs-devel wrote: > > > [...]
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ne1Ss-0008Ej-2p
Subject: Re: [f2fs-dev] [PATCH 4/5] f2fs: get rid of stale fault injection
 code
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
Cc: linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 04/11, Chao Yu wrote:
> On 2022/4/6 11:01, Yufen Yu via Linux-f2fs-devel wrote:
> > Hi,
> > =

> > On 2022/4/1 16:28, Chao Yu wrote:
> > > On 2022/4/1 15:19, Yufen Yu via Linux-f2fs-devel wrote:
> > > > Nowly, we can use new fault injection framework. Just delete the
> > > > stale fault injection code.
> > > > =

> > > > Signed-off-by: Yufen Yu <yuyufen@huawei.com>
> > > > ---
> > > > =A0 fs/f2fs/checkpoint.c |=A0 2 +-
> > > > =A0 fs/f2fs/f2fs.h=A0=A0=A0=A0=A0=A0 | 51 ++-----------------------=
-----------------
> > > > =A0 fs/f2fs/super.c=A0=A0=A0=A0=A0 | 53 ---------------------------=
-----------------
> > > > =A0 fs/f2fs/sysfs.c=A0=A0=A0=A0=A0 | 23 -------------------
> > > > =A0 4 files changed, 3 insertions(+), 126 deletions(-)
> > > > =

> > =

> > ...
> > =

> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 break;
> > > > @@ -1963,14 +1920,6 @@ static int f2fs_show_options(struct seq_file=
 *seq, struct dentry *root)
> > > > =A0=A0=A0=A0=A0 if (F2FS_IO_SIZE_BITS(sbi))
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 seq_printf(seq, ",io_bits=3D%u",
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 F2FS_OPTION(sbi=
).write_io_size_bits);
> > > > -#ifdef CONFIG_F2FS_FAULT_INJECTION
> > > > -=A0=A0=A0 if (test_opt(sbi, FAULT_INJECTION)) {
> > > > -=A0=A0=A0=A0=A0=A0=A0 seq_printf(seq, ",fault_injection=3D%u",
> > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 F2FS_OPTION(sbi).fau=
lt_info.inject_rate);
> > > > -=A0=A0=A0=A0=A0=A0=A0 seq_printf(seq, ",fault_type=3D%u",
> > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 F2FS_OPTION(sbi).fau=
lt_info.inject_type);
> > > > -=A0=A0=A0 }
> > > > -#endif
> > > =

> > > This will cause regression due to it breaks application usage w/ -o
> > > fault_* mountoption..., I don't think this is the right way.
> > =

> > =

> > Thanks for catching this. I admit it's a problem. But, IMO fault_* mount
> > option are mostly been used in test, not in actual product. So, I think
> > it may just affect some test applications. With the common fault inject=
ion
> > framework, it can be more easy and flexible to do fault injection test.
> > Therefore, I want to remove the two mount options directly.
> > =

> > If you really worried about compatibility, how about just reserving the
> > two inject_* options but without doing any thing for them. We actually
> > configure fault injections by debugfs in this patch.
> > =

> > Or do you have more better suggestion?
> =

> Could you please consider to keep original logic of f2fs fault injection
> if user use inject_* options, otherwise following common fault injection
> framework?
> =

> Thoughts?

I think it'd be useful to test roll-forward recovery flow by using those mo=
unt
options, since runtime fault injection cannot enable it during mount.

BTW, what is the real benefit to use the fault injection framework?

> =

> Thanks,
> =

> > =

> > Thanks,
> > Yufen
> > =

> > =

> > =

> > =

> > =

> > =

> > =

> > =

> > _______________________________________________
> > Linux-f2fs-devel mailing list
> > Linux-f2fs-devel@lists.sourceforge.net
> > https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
