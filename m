Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F361E8E27
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 30 May 2020 08:17:26 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jeuo7-00053P-VR; Sat, 30 May 2020 06:17:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <krisman@collabora.com>) id 1jeuo6-00053A-9a
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 30 May 2020 06:17:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:In-Reply-To:
 Date:References:Subject:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=J0glF3H5946zPDWdiae7Gp/+QSDi4Qdumm0IQgdOR58=; b=MxntQj7zLQ+fh8CH7pH0DxvdDv
 n6YsbLkuHuILF7G0K/erfrEp1+wr9S5Ao7+odsG2Sp+ahdDaUCPNrOX5CjyycfFExwaGFaHnU4Bfa
 USjaS1v3R4uLK+x4A96amsYLupx7qzzJ6MzDPRgGpTNJbAu/ePs94t4JLQ5wvKh5rhRw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:References:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=J0glF3H5946zPDWdiae7Gp/+QSDi4Qdumm0IQgdOR58=; b=D9GVNv/piUOB8Fy/GEc+RSuzyx
 IGPiTSLeIHXEK5FjoHys9ERtXpasNhjQts23hqtE0j8EF+XNqzwkv3xapehbRWNOmyP0vTw1x/xpJ
 TbKzRq9MB7M1tw1teEN4AIEPUCT39ByofpDim+XZJZ1IvuFX6PKnvJutG4Wf5jwRZvG0=;
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jeuo4-003eAi-9C
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 30 May 2020 06:17:22 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: krisman) with ESMTPSA id 121BA2A49A0
From: Gabriel Krisman Bertazi <krisman@collabora.com>
To: Eric Biggers <ebiggers@kernel.org>
Organization: Collabora
References: <20200530060216.221456-1-ebiggers@kernel.org>
Date: Sat, 30 May 2020 02:17:02 -0400
In-Reply-To: <20200530060216.221456-1-ebiggers@kernel.org> (Eric Biggers's
 message of "Fri, 29 May 2020 23:02:16 -0700")
Message-ID: <85d06mkkv5.fsf@collabora.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linux.org.uk]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [46.235.227.227 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
 -0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jeuo4-003eAi-9C
Subject: Re: [f2fs-dev] [PATCH] ext4: avoid utf8_strncasecmp() with unstable
 name
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
Cc: Daniel Rosenberg <drosen@google.com>, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Al Viro <viro@zeniv.linux.org.uk>,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 Gabriel Krisman Bertazi <krisman@collabora.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Eric Biggers <ebiggers@kernel.org> writes:

> From: Eric Biggers <ebiggers@google.com>
>
> If the dentry name passed to ->d_compare() fits in dentry::d_iname, then
> it may be concurrently modified by a rename.  This can cause undefined
> behavior (possibly out-of-bounds memory accesses or crashes) in
> utf8_strncasecmp(), since fs/unicode/ isn't written to handle strings
> that may be concurrently modified.
>
> Fix this by first copying the filename to a stack buffer if needed.
> This way we get a stable snapshot of the filename.
>
> Fixes: b886ee3e778e ("ext4: Support case-insensitive file name lookups")
> Cc: <stable@vger.kernel.org> # v5.2+
> Cc: Al Viro <viro@zeniv.linux.org.uk>
> Cc: Daniel Rosenberg <drosen@google.com>
> Cc: Gabriel Krisman Bertazi <krisman@collabora.co.uk>
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
>  fs/ext4/dir.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>
> diff --git a/fs/ext4/dir.c b/fs/ext4/dir.c
> index c654205f648dd..19aef8328bb18 100644
> --- a/fs/ext4/dir.c
> +++ b/fs/ext4/dir.c
> @@ -675,6 +675,7 @@ static int ext4_d_compare(const struct dentry *dentry, unsigned int len,
>  	struct qstr qstr = {.name = str, .len = len };
>  	const struct dentry *parent = READ_ONCE(dentry->d_parent);
>  	const struct inode *inode = READ_ONCE(parent->d_inode);
> +	char strbuf[DNAME_INLINE_LEN];
>  
>  	if (!inode || !IS_CASEFOLDED(inode) ||
>  	    !EXT4_SB(inode->i_sb)->s_encoding) {
> @@ -683,6 +684,22 @@ static int ext4_d_compare(const struct dentry *dentry, unsigned int len,
>  		return memcmp(str, name->name, len);
>  	}
>  
> +	/*
> +	 * If the dentry name is stored in-line, then it may be concurrently
> +	 * modified by a rename.  If this happens, the VFS will eventually retry
> +	 * the lookup, so it doesn't matter what ->d_compare() returns.
> +	 * However, it's unsafe to call utf8_strncasecmp() with an unstable
> +	 * string.  Therefore, we have to copy the name into a temporary buffer.
> +	 */
> +	if (len <= DNAME_INLINE_LEN - 1) {
> +		unsigned int i;
> +
> +		for (i = 0; i < len; i++)
> +			strbuf[i] = READ_ONCE(str[i]);
> +		strbuf[len] = 0;
> +		qstr.name = strbuf;
> +	}
> +

Could we avoid this if the casefolded version were cached in the dentry?
Then we could use utf8_strncasecmp_folded which would be safe.  Would
this be acceptable for vfs?

>  	return ext4_ci_compare(inode, name, &qstr, false);
>  }

-- 
Gabriel Krisman Bertazi


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
