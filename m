Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B549E1562AB
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  8 Feb 2020 03:12:40 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j0Fbo-0000xT-Re; Sat, 08 Feb 2020 02:12:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <viro@ftp.linux.org.uk>) id 1j0Fbn-0000xI-53
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 08 Feb 2020 02:12:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Sender:In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hBDMXf4vxhewV58fdRcsCvQIgTioNM3MzXdpE7IEX+Q=; b=M5hpoJHMpKrm3loMXQ+PhuPhf
 DrZmt/urIPkdoL0goyuyAIo5PqB7f92uyCP4Rc7eagMDFcFi6WF1sbHW89apoajlTt2v75/46LzOd
 Dh5tpQIvSo1xsm2T6EGQkQ8P7aTL89C5KMXAmFByYnb4QYROW44TvG5JVPK4CIXOIBuy8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Sender:In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hBDMXf4vxhewV58fdRcsCvQIgTioNM3MzXdpE7IEX+Q=; b=T/niSLj5XPIHGKT0WwQLx+t8hw
 AsRQOMFA+8SWV3r3TJn1C6iw/vh/hElQn9Us3HzPr5Mv9BoK7v7neTj7M5a9EJsJksJhuckNroncR
 QHXzQ3tPA+B4g2H9O1sCJqV3TBtPuJijfqnMkIClsLB91ryLVpu4Z74PcerhgDOS5UU8=;
Received: from zeniv.linux.org.uk ([195.92.253.2])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j0Fbl-00Du53-AD
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 08 Feb 2020 02:12:35 +0000
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1j0FbU-0098pV-DJ; Sat, 08 Feb 2020 02:12:16 +0000
Date: Sat, 8 Feb 2020 02:12:16 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Daniel Rosenberg <drosen@google.com>
Message-ID: <20200208021216.GE23230@ZenIV.linux.org.uk>
References: <20200208013552.241832-1-drosen@google.com>
 <20200208013552.241832-3-drosen@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200208013552.241832-3-drosen@google.com>
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [195.92.253.2 listed in wl.mailspike.net]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1j0Fbl-00Du53-AD
Subject: Re: [f2fs-dev] [PATCH v7 2/8] fs: Add standard casefolding support
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
Cc: kernel-team@android.com, Theodore Ts'o <tytso@mit.edu>,
 Jonathan Corbet <corbet@lwn.net>, Richard Weinberger <richard@nod.at>,
 Andreas Dilger <adilger.kernel@dilger.ca>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Eric Biggers <ebiggers@kernel.org>, linux-fscrypt@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org,
 Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Feb 07, 2020 at 05:35:46PM -0800, Daniel Rosenberg wrote:

> +int generic_ci_d_compare(const struct dentry *dentry, unsigned int len,
> +			  const char *str, const struct qstr *name)
> +{
> +	const struct dentry *parent = READ_ONCE(dentry->d_parent);
> +	const struct inode *inode = READ_ONCE(parent->d_inode);
> +	const struct super_block *sb = dentry->d_sb;
> +	const struct unicode_map *um = sb->s_encoding;
> +	struct qstr entry = QSTR_INIT(str, len);
> +	int ret;
> +
> +	if (!inode || !needs_casefold(inode))
> +		goto fallback;
> +
> +	ret = utf8_strncasecmp(um, name, &entry);

Again, is that safe in case when the contents of the string str points to
keeps changing under you?


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
