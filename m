Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D8570D21208
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 14 Jan 2026 21:01:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=23tkGS9YN1boqSfYnNLZ9+vdLD0dBfI5lTAlwHNZWGw=; b=GTPAr5ySHONib0cuBZ7JVgnGyg
	0R5EpzCfc76soNT7FYgu8u0nN02U+Fchu/BCxXbhQ7HmEkC0Zvq8TbyslVi0ywikjxnBjDaD4C5J+
	qSJaUbqWZ/rgZrXqpbGzpDcuaFpyPpdZn+9AnK4w13X7Too0ZOxJSUq9DPift2/vPZ5w=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vg73o-0007T4-4J;
	Wed, 14 Jan 2026 20:01:44 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <djwong@kernel.org>) id 1vg73m-0007Sy-Hc
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 14 Jan 2026 20:01:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QfJ5nd/pxIB9V6grtoE6Pla0rYSua5AETd7L3Vq1nrA=; b=E2wpQ3VbEwSrcizGfFnHbX3eut
 jnWyoyslIE7CPNYF9csCnEoffT07p96xFb1vrfNYltOMz8KHSZKgfu2+Rcoh7KStYq7WRuiy8C9On
 uJ7UtQnKOTWqfU7Q5Vjst8mxHSrezDMUfEctnn2d1itivCbPkJuvmJ+aosYIV6LQnAg8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QfJ5nd/pxIB9V6grtoE6Pla0rYSua5AETd7L3Vq1nrA=; b=U66IrsSOXLznHmdKzKqoPAb0MF
 JjShVdPHKO28u5mRIGB+F3mF3YSYV6T+Jo0TlM8/Np3e07IZbgDhKj0DF46XcKkniEa43lWAndV3/
 aLxfu1vjjo10NoDCYFLMkMv2iVXpRb7ai6X/lmHJn3DWJfQ854t6o/PiCXkf24Mu5nos=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vg73m-0004tp-2t for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 14 Jan 2026 20:01:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 9CC124403B;
 Wed, 14 Jan 2026 20:01:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F65BC4CEF7;
 Wed, 14 Jan 2026 20:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768420891;
 bh=UjkIcWoNSe9/a1EUTFB+7URBpKEndTzvxBxd5f8spV4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hBZwUrWpkL7RNu1xJ2TiDEUsEWnQvVHTuq5cXS+8nyD7SG5Fh5ZhgVNWowLeQ7Tc0
 g+uWq71bqae6Iev8H5mVgUAdPVj+NLr7hR091p+EixtcdjV5G8lXJ/q+b3WomXtG1s
 bop0BcRwdDYFAunxuihoSnRx/IpWVXMoE5kplK8mCxexB7AWACk2ciiErmZ2uYl3SO
 LNfFoOGHwpHYIfA6yNzyYLHWioN6voRWLcJbGCv+grQjNJnmLK16A+BVB3sErelXBF
 HIK6FJc0y+d5AikHOkaA01i2j5Igi01j8vJNeEcBIqQTJGTA1FiFHTT6mECNnRRWMO
 O1EKRXZzIefcQ==
Date: Wed, 14 Jan 2026 12:01:30 -0800
To: Chuck Lever <cel@kernel.org>
Message-ID: <20260114200130.GJ15551@frogsfrogsfrogs>
References: <20260114142900.3945054-1-cel@kernel.org>
 <20260114142900.3945054-2-cel@kernel.org>
 <3kq2tbdcoxxw3y2gseg7vtnhnze5ee536fu4rnsn22yjrpsmb4@fpfueqqiji5q>
 <7b6aa90f-79dc-443a-8e5f-3c9b88892271@app.fastmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7b6aa90f-79dc-443a-8e5f-3c9b88892271@app.fastmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Jan 14, 2026 at 02:01:14PM -0500, Chuck Lever wrote:
 > > > On Wed, Jan 14, 2026, at 1:11 PM, Jan Kara wrote: > > On Wed 14-01-26
 09:28:44, Chuck Lever wrote: > >> From: Chuck Lever <chuck.leve [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vg73m-0004tp-2t
Subject: Re: [f2fs-dev] [PATCH v4 01/16] fs: Add case sensitivity info to
 file_kattr
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
From: "Darrick J. Wong via Linux-f2fs-devel"
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: "Darrick J. Wong" <djwong@kernel.org>
Cc: Jan Kara <jack@suse.cz>, Paulo Alcantara <pc@manguebit.org>,
 Yuezhang Mo <yuezhang.mo@sony.com>, Carlos Maiolino <cem@kernel.org>,
 almaz.alexandrovich@paragon-software.com, adilger.kernel@dilger.ca,
 vira@imap.suse.de, linux-cifs@vger.kernel.org,
 Steve French <sfrench@samba.org>, Viacheslav Dubeyko <slava@dubeyko.com>,
 linux-ext4@vger.kernel.org, Namjae Jeon <linkinjeon@kernel.org>,
 Shyam Prasad N <sprasad@microsoft.com>, frank.li@vivo.com,
 linux-nfs@vger.kernel.org, Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 glaubitz@physik.fu-berlin.de, Jaegeuk Kim <jaegeuk@kernel.org>,
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
 Christian Brauner <brauner@kernel.org>, Theodore Tso <tytso@mit.edu>,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 senozhatsky@chromium.org, Chuck Lever <chuck.lever@oracle.com>,
 Hans de Goede <hansg@kernel.org>, Anna Schumaker <anna@kernel.org>,
 linux-fsdevel@vger.kernel.org, Sungjong Seo <sj1557.seo@samsung.com>,
 Trond Myklebust <trondmy@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Jan 14, 2026 at 02:01:14PM -0500, Chuck Lever wrote:
> 
> 
> On Wed, Jan 14, 2026, at 1:11 PM, Jan Kara wrote:
> > On Wed 14-01-26 09:28:44, Chuck Lever wrote:
> >> From: Chuck Lever <chuck.lever@oracle.com>
> >> 
> >> Enable upper layers such as NFSD to retrieve case sensitivity
> >> information from file systems by adding case_insensitive and
> >> case_nonpreserving boolean fields to struct file_kattr.
> >> 
> >> These fields default to false (POSIX semantics: case-sensitive and
> >> case-preserving), allowing filesystems to set them only when
> >> behavior differs from the default.
> >> 
> >> Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
> > ...
> >> diff --git a/include/uapi/linux/fs.h b/include/uapi/linux/fs.h
> >> index 66ca526cf786..07286d34b48b 100644
> >> --- a/include/uapi/linux/fs.h
> >> +++ b/include/uapi/linux/fs.h
> >> @@ -229,10 +229,20 @@ struct file_attr {
> >>  	__u32 fa_nextents;	/* nextents field value (get)   */
> >>  	__u32 fa_projid;	/* project identifier (get/set) */
> >>  	__u32 fa_cowextsize;	/* CoW extsize field value (get/set) */
> >> +	/* VER1 additions: */
> >> +	__u32 fa_case_behavior;	/* case sensitivity (get) */
> >> +	__u32 fa_reserved;
> >>  };
> >>  
> >>  #define FILE_ATTR_SIZE_VER0 24
> >> -#define FILE_ATTR_SIZE_LATEST FILE_ATTR_SIZE_VER0
> >> +#define FILE_ATTR_SIZE_VER1 32
> >> +#define FILE_ATTR_SIZE_LATEST FILE_ATTR_SIZE_VER1
> >> +
> >> +/*
> >> + * Case sensitivity flags for fa_case_behavior
> >> + */
> >> +#define FS_CASE_INSENSITIVE	0x00000001	/* case-insensitive lookups */
> >> +#define FS_CASE_NONPRESERVING	0x00000002	/* case not preserved */
> >
> > This is a matter of taste so not sure what others think about it but
> > file_attr already have fa_xflags field and there is already one flag which
> > doesn't directly correspond to on-disk representation (FS_XFLAG_HASATTR) so
> > we could also put the two new flags in there... I have hard time imagining
> > fa_case_behavior would grow past the two flags you've introduced so u32
> > seems a bit wasteful.
> 
> No problem. I'll wait for additional guidance on this.

Sounds like a better use of space in struct file_attr than adding
another pair of u32.

--D

> 
> -- 
> Chuck Lever
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
