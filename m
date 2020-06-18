Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7870F1FDEB8
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 18 Jun 2020 03:38:56 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jljW2-0005rx-2I; Thu, 18 Jun 2020 01:38:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <david@fromorbit.com>) id 1jljW0-0005rl-7m
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 18 Jun 2020 01:38:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GD8+nqSZXmAIjAnqZCnCIdu/FpBbCWXKROEQVLCAYeM=; b=ERUSAO4Y8Y+lh2MndhYzHDFqWo
 /EutIfElJ/28Lt98es738vJAV2DtMwibSigJVcj0pD8nDTYzbrrevq1/lH59aqxKx3zcFAG47UrCK
 vL8uG/Uu0uz186x6VHhBfECo7OjbTY40uHJNcDUKc1XlTxMTbI7InVa/Dvlgnd7nLOII=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GD8+nqSZXmAIjAnqZCnCIdu/FpBbCWXKROEQVLCAYeM=; b=INvJa8F1gFIMmrb97g0HAjQpKt
 qJz36zDj4gAiZE+6D/VyhR/3DGYBEJU30Jmc/OvHX//iNl8Kr6zI0IUhH7d3fp9eQRscyqr24FgK/
 Jrd7jsKgNycz6MGsGahcrvLJyiXRutioM5p8YbiL4a2D8z3fIN8fdcmYCeRjN5hgpSP4=;
Received: from [211.29.132.59] (helo=mail108.syd.optusnet.com.au)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtp (Exim 4.92.2)
 id 1jljVy-0072a3-5J
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 18 Jun 2020 01:38:52 +0000
Received: from dread.disaster.area (unknown [49.180.124.177])
 by mail108.syd.optusnet.com.au (Postfix) with ESMTPS id BB9BD1AEAF2;
 Thu, 18 Jun 2020 11:19:20 +1000 (AEST)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
 (envelope-from <david@fromorbit.com>)
 id 1jljCy-0001gV-Fl; Thu, 18 Jun 2020 11:19:12 +1000
Date: Thu, 18 Jun 2020 11:19:12 +1000
From: Dave Chinner <david@fromorbit.com>
To: Satya Tangirala <satyat@google.com>
Message-ID: <20200618011912.GA2040@dread.disaster.area>
References: <20200617075732.213198-1-satyat@google.com>
 <20200617075732.213198-2-satyat@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200617075732.213198-2-satyat@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Optus-CM-Score: 0
X-Optus-CM-Analysis: v=2.3 cv=W5xGqiek c=1 sm=1 tr=0
 a=k3aV/LVJup6ZGWgigO6cSA==:117 a=k3aV/LVJup6ZGWgigO6cSA==:17
 a=kj9zAlcOel0A:10 a=nTHF0DUjJn0A:10 a=1XWaLZrsAAAA:8 a=7-415B0cAAAA:8
 a=Yn2aIsqHhkDqJBDDX5kA:9 a=CjuIK1q_8ugA:10 a=biEYGPWJfzWAr4FL6Ov7:22
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: fromorbit.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 1.0 RDNS_NONE Delivered to internal network by a host with no rDNS
 -0.8 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jljVy-0072a3-5J
Subject: Re: [f2fs-dev] [PATCH 1/4] fs: introduce SB_INLINECRYPT
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
Cc: linux-fsdevel@vger.kernel.org, linux-fscrypt@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Jun 17, 2020 at 07:57:29AM +0000, Satya Tangirala wrote:
> Introduce SB_INLINECRYPT, which is set by filesystems that wish to use
> blk-crypto for file content en/decryption. This flag maps to the
> '-o inlinecrypt' mount option which multiple filesystems will implement,
> and code in fs/crypto/ needs to be able to check for this mount option
> in a filesystem-independent way.
> 
> Signed-off-by: Satya Tangirala <satyat@google.com>
> ---
>  fs/proc_namespace.c | 1 +
>  include/linux/fs.h  | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/fs/proc_namespace.c b/fs/proc_namespace.c
> index 3059a9394c2d..e0ff1f6ac8f1 100644
> --- a/fs/proc_namespace.c
> +++ b/fs/proc_namespace.c
> @@ -49,6 +49,7 @@ static int show_sb_opts(struct seq_file *m, struct super_block *sb)
>  		{ SB_DIRSYNC, ",dirsync" },
>  		{ SB_MANDLOCK, ",mand" },
>  		{ SB_LAZYTIME, ",lazytime" },
> +		{ SB_INLINECRYPT, ",inlinecrypt" },
>  		{ 0, NULL }
>  	};
>  	const struct proc_fs_opts *fs_infop;

NACK.

SB_* flgs are for functionality enabled on the superblock, not for
indicating mount options that have been set by the user.

If the mount options are directly parsed by the filesystem option
parser (as is done later in this patchset), then the mount option
setting should be emitted by the filesystem's ->show_options
function, not a generic function.

The option string must match what the filesystem defines, not
require separate per-filesystem and VFS definitions of the same
option that people could potentially get wrong (*cough* i_version vs
iversion *cough*)....

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
