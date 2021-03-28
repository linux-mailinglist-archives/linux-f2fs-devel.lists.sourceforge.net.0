Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B99734BDBB
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 28 Mar 2021 19:40:07 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lQZOG-0004nz-VK; Sun, 28 Mar 2021 17:39:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <viro@ftp.linux.org.uk>) id 1lQZOF-0004na-E7
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 28 Mar 2021 17:39:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Sender:In-Reply-To:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vHXzHP2VL8hUYyxUa0+wVq8oLnPU4A3ExxFHrDXBr34=; b=fRufOHQtTVIFIDFDTYIBI156jC
 qs2k0/4Y8WRRrWHmqiewXuTkCV5DPxQe7QeD7442f0GEyyil8baQuyeeTM5FV/yoS67K5p0EMv8kp
 e23rEV7K+Mpc7I9E+H78qf+bq1c2W0OTo09kCzfkHVzpoRgvROm211fT2Qt+FiMBHfc0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Sender:In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vHXzHP2VL8hUYyxUa0+wVq8oLnPU4A3ExxFHrDXBr34=; b=LKobNsqIGWjsTa1bR6kr6KWnMU
 F0TePzs2rLtowXGmepRHWo0KgNv63FncPPUas74RE+KhzKWFsP98yE4lwI+emy6zolS4K3CdLrjOS
 4tqyyC77QfhFnZOy75TVktSchfPalozWCLdEDKnJfO9HEPGirWioWmsWvjJWpepo6vhQ=;
Received: from zeniv-ca.linux.org.uk ([142.44.231.140])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lQZO5-00044n-AO
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 28 Mar 2021 17:39:55 +0000
Received: from viro by zeniv-ca.linux.org.uk with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1lQZNk-000U9Y-BT; Sun, 28 Mar 2021 17:39:24 +0000
Date: Sun, 28 Mar 2021 17:39:24 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@collabora.com>
Message-ID: <YGC/TNXhpzRoLjGM@zeniv-ca.linux.org.uk>
References: <20210328144356.12866-1-andrealmeid@collabora.com>
 <20210328144356.12866-2-andrealmeid@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210328144356.12866-2-andrealmeid@collabora.com>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1lQZO5-00044n-AO
Subject: Re: [f2fs-dev] [PATCH 1/3] fs/dcache: Add d_clear_dir_neg_dentries()
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
Cc: linux-ext4@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>,
 Daniel Rosenberg <drosen@google.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net,
 Andreas Dilger <adilger.kernel@dilger.ca>, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, kernel@collabora.com, krisman@collabora.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Sun, Mar 28, 2021 at 11:43:54AM -0300, Andr=E9 Almeida wrote:

> +/**
> + * d_clear_dir_neg_dentries - Remove negative dentries in an inode
> + * @dir: Directory to clear negative dentries
> + *
> + * For directories with negative dentries that are becoming case-insensi=
tive
> + * dirs, we need to remove all those negative dentries, otherwise they w=
ill
> + * become dangling dentries. During the creation of a new file, if a d_h=
ash
> + * collision happens and the names match in a case-insensitive, the name=
 of
> + * the file will be the name defined at the negative dentry, that can be
> + * different from the specified by the user. To prevent this from happen=
ing, we
> + * need to remove all dentries in a directory. Given that the directory =
must be
> + * empty before we call this function we are sure that all dentries ther=
e will
> + * be negative.
> + */
> +void d_clear_dir_neg_dentries(struct inode *dir)
> +{
> +	struct dentry *alias, *dentry;
> +
> +	hlist_for_each_entry(alias, &dir->i_dentry, d_u.d_alias) {
> +		list_for_each_entry(dentry, &alias->d_subdirs, d_child) {
> +			d_drop(dentry);
> +			dput(dentry);
> +		}
> +	}
> +}

That makes no sense whatsoever.
	1) directories can never have more than one alias
	2) what the hell are you doing to refcounts on those children?


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
