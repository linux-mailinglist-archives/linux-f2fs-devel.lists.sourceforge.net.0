Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 352071477A4
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 24 Jan 2020 05:31:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Message-ID:Date:In-Reply-To:References:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FRmO6ohXezjtyt7z8da4ZBLKu2a5QWnHCR0SIgjrgDs=; b=e/SR0CHNhEZhLzSJXeRisFPHzX
	fA0ahtVCbsMf1k1w77sIyKeMlxhZrNIbJAheoKAf1qK1oWrSSTKFqwSN6Tt5q+Tl/eq4Qvd8sTJPe
	JMdazi2P+pQQVC3QkYiph899G32LMNfl476I2jbm0GsuhXbc92O9R84lB/dMtnTDAQ0Y=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iuqcm-0006im-Hu; Fri, 24 Jan 2020 04:31:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <drosen@google.com>) id 1iuqce-0006iV-Tf
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 24 Jan 2020 04:31:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YARMc3ae9hSUEoLGMas34bGpYXx9jRcQkvor0pcL47o=; b=R4Pr0dvQLWM6YTtebA6Dg9skT2
 Wf7Ua8CGPIz4OrTKEwM2ZV2ay0WcVh8MOohtfWyfs+rJafom9Q4gj6icLA1ZYW+boZPOizp9F7+IP
 VYzdfWllw4/BtzqAuUZAWFRfy3sB/dUAtsx8zAefNwzVfhbY9hbBfIEs3MYzwj5ot6P0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YARMc3ae9hSUEoLGMas34bGpYXx9jRcQkvor0pcL47o=; b=IZar6OjY4gZDMY52nyO1Qp42zI
 pACMCE48iiHUi7mIZngQ+e2ZXz/5FOSQ9kUEFdsR8H+kuWMyWwA2n+ARxOjzwYBFY1VUC1sTibMY3
 d03r6cOT/lPw0wfzbtkALMT9zAznv7Q7dPsXxHNoJvPz27tVct8YK27PsK0dKZVQdvSg=;
Received: from mail-lj1-f193.google.com ([209.85.208.193])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1iuqcd-00GYLF-F1
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 24 Jan 2020 04:31:08 +0000
Received: by mail-lj1-f193.google.com with SMTP id o11so916664ljc.6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 23 Jan 2020 20:31:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YARMc3ae9hSUEoLGMas34bGpYXx9jRcQkvor0pcL47o=;
 b=KDHO7h9B/b3mjy26Oj4EeSJIUNyQLYKaSj3d1nBNy4K7dVvqvhrzQt3G+uksHtglCC
 GEn7l0fqTV7YiLooSM8wJDBDZ3zMa1NiXyT+I4cRb1BWaZgPHz2JpFTvojB+HO94ozad
 MFaWKBQ9Zo4BEUhjLXI4paXN7kyNHtoN96Dwri5CF7MjQQUEfySc0AQBNxyC2R8iJZCg
 guQxm94eI0DXd65SS/rnuHoJaoHhIN0BgEW5d7+6uC/9ey1p7B8TnBe/F7DCn8v2dGTO
 IOVEJ7yvZF/HCRcAWrK9qPC6Itzo8kSjahJNwMYca4x2RJsn6vyrLjbauzKhHQ8haKAe
 U9uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YARMc3ae9hSUEoLGMas34bGpYXx9jRcQkvor0pcL47o=;
 b=OHZUG+dOXzh/5qnw2SmcgBl+cy3bh1dhj+Cy0QHYGAMYZewvEobP625z3uza4bA1DL
 3Wch7VGIxwQA/WK53t88omP82QX6bHIkfZHxt2qVurtD1APSvdlLBJV/lUVV8uEQA1qc
 URYth7qgQhztDGChMuY8pePcSfBSNF5aNNP0ctpzwzKjkVKN1DTD9d13RgTzcc15fqbb
 jxDyYXfcfR93T+w6lrR9Uts6wpI5BPe0ndo+SnNOw4/ae8sFSXHCgic8Zw8+OVfsWcxR
 KdLPH8G+xmQ2+gF5myTYxSRvcSBEGrjxEMhvogFbucF8eeyMAGZ2BzwNCh2HCh2G13OM
 eZzQ==
X-Gm-Message-State: APjAAAU2F3RA5q6Tj1dvN+/L483vGmFShdCtvqrGwHnQQ4hUBvUYdaB+
 XxtnttKcQHit4rCjkuqD6V7G7YqApsPCwAb3fGEKvR0cy3g=
X-Google-Smtp-Source: APXvYqxDuXJqv/c/SqXLq4l0cAQvIWw6dIaAJm1RLNe4FSj10K4FMOIdAwv3/v/qIrOL5GnNI2cG/1NfCFFst9nvTGM=
X-Received: by 2002:a2e:7816:: with SMTP id t22mr1024528ljc.161.1579840260417; 
 Thu, 23 Jan 2020 20:31:00 -0800 (PST)
MIME-Version: 1.0
References: <20200117214246.235591-1-drosen@google.com>
 <20200117214246.235591-6-drosen@google.com>
 <20200120013528.GY8904@ZenIV.linux.org.uk>
In-Reply-To: <20200120013528.GY8904@ZenIV.linux.org.uk>
Date: Thu, 23 Jan 2020 20:30:49 -0800
Message-ID: <CA+PiJmQPFG7OehStFfNQE_7MGwgozhaa0TxZd+aHL2cFLMFbsA@mail.gmail.com>
To: Al Viro <viro@zeniv.linux.org.uk>
X-Spam-Score: -15.8 (---------------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.208.193 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.193 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -7.5 USER_IN_DEF_SPF_WL     From: address is in the default SPF white-list
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.5 ENV_AND_HDR_SPF_MATCH  Env and Hdr From used in default SPF WL Match
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iuqcd-00GYLF-F1
Subject: Re: [f2fs-dev] [PATCH v3 5/9] vfs: Fold casefolding into vfs
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
From: Daniel Rosenberg via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Daniel Rosenberg <drosen@google.com>
Cc: Theodore Ts'o <tytso@mit.edu>, Jonathan Corbet <corbet@lwn.net>,
 kernel-team@android.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Eric Biggers <ebiggers@kernel.org>, linux-fscrypt@vger.kernel.org,
 Andreas Dilger <adilger.kernel@dilger.ca>, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org,
 Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

> ... buggering the filesystems (and boxen) that never planned to use
> that garbage.
>
I'm planning to rework this as dentry ops again. Your other comments
point out some issues that also exist in the old dentry_operations, so
that's a good opportunity to fix those up. How do you feel about just
having the two entries in struct super_block? With them there, I can
add the dentry_operations to fs/unicode where they won't bother anyone
else, while not making every filesystem that uses it have to carry
near identical code.

>
> Are you serious?
>         1) who said that ->d_inode is stable here?  If we are in RCU mode,
> it won't be.
>         2) page-sized kmalloc/kfree *ON* *COMPONENT* *AFTER* *COMPONENT*?
>

#2 is the part that made me the saddest in the patch. I'm planning to
move this to the unicode subsystem so it can just walk through the
name as it computes the hash without needing any allocation.

>
> ... and again, you are pulling in a lot of cachelines.
>

I probably should've just given it a DCACHE flag, like what fscrypt is
using. A simple flag there would've done everything that I'm doing
without making the cache super sad and making any attempts at making
it actually work with RCU much simpler.

> <understatement> IMO the whole thing is not a good idea. </understatement>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
