Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E7DB6662CFB
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  9 Jan 2023 18:38:56 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pEw6k-0005rf-U2;
	Mon, 09 Jan 2023 17:38:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1pEw6j-0005rZ-Pi
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 09 Jan 2023 17:38:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eq4eK0frN4ucdItJt9W072NsXYsMuqc1SrUj8dAZ6LE=; b=M7vNOtAyVQ7gkzT0iCAyXRw8y7
 KJAEr1Rk8+hmxL3Crgr/fzK8ff10a7M9Wp9A+9Pp833zOYJGze9H1LqcTBEhgOor/Cz8EfIgf913l
 xtDINcp/D5/sGuYuPu3WOyTSenCebQwmlnWShdsuXC+UOw6B4yD7WWSnli7+o3UwgQq4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=eq4eK0frN4ucdItJt9W072NsXYsMuqc1SrUj8dAZ6LE=; b=ScLG1kAvxm84RxxYagptFZ7u9S
 Xw76DUGCWSmETmkO0fK+bk2cRXPsIOUmKkAwkjj7RN1XYFGhv1+81mu8KiLIHeETeMMZgizJHfrl+
 wfNJLooymcwi/76+VkrWTvfkZnQjBUX7QNY8wjQ/o1gUgubMaAevygOM8chyWr/piR1o=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pEw6j-00BimZ-7T for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 09 Jan 2023 17:38:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CB0576121D;
 Mon,  9 Jan 2023 17:38:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF4CFC433D2;
 Mon,  9 Jan 2023 17:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673285923;
 bh=A/Wg7s9P/2Y1HbN5fBlhTvxDCGhhiuEK438+ZivawnE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=q2CjRiwR5coVPsn0Ls2v4tlJm1/GeKIXIKDZeKo++33grnflplgpBlp4XW5R3oZIk
 gIsFiYsgGt+5katADlENyvKPPscsvqBXjsS0koU8qNoT8PagVGnBMrzAW9W0ZyUZUa
 yZjnoqWbVpRcq4JVPHDIun66WsjfwvWtDm+izCjmW+tnFekWIIcTQ2IQw/NypD7l0+
 cVFQzjgeSiC7O09NmbU8NhVUiJN5mWFGe2XxlGoCGP8x1QYRF6/3BYCY+1YoxsUGLp
 gjPfIPcEe8sTWpJYMs58CJnAqjAQ9ZcLQA6eAFCzwQVCp2EMspM9JodyfWfSi6BkFl
 gbpaIO5Aa/ccg==
Date: Mon, 9 Jan 2023 09:38:41 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Message-ID: <Y7xRIZfla92yzK9N@sol.localdomain>
References: <20221223203638.41293-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221223203638.41293-1-ebiggers@kernel.org>
X-Spam-Score: -3.4 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Dec 23, 2022 at 12:36:27PM -0800, Eric Biggers wrote:
 > [This patchset applies to mainline + some fsverity cleanups I sent out
 > recently. You can get everything from tag "fsverity-non4k-v2" o [...] 
 Content analysis details:   (-3.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 2.5 SUSPICIOUS_RECIPS      Similar addresses in recipient list
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pEw6j-00BimZ-7T
Subject: Re: [f2fs-dev] [PATCH v2 00/11] fsverity: support for non-4K pages
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
Cc: Andrey Albershteyn <aalbersh@redhat.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Dec 23, 2022 at 12:36:27PM -0800, Eric Biggers wrote:
> [This patchset applies to mainline + some fsverity cleanups I sent out
>  recently.  You can get everything from tag "fsverity-non4k-v2" of
>  https://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git ]

I've applied this patchset for 6.3, but I'd still greatly appreciate reviews and
acks, especially on the last 4 patches, which touch files outside fs/verity/.

(I applied it to
https://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git/log/?h=fsverity for now,
but there might be a new git repo soon, as is being discussed elsewhere.)

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
