Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E88E36D75DA
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  5 Apr 2023 09:49:48 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pjxtp-0002ag-QR;
	Wed, 05 Apr 2023 07:49:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <brauner@kernel.org>) id 1pjxtp-0002aa-Az
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Apr 2023 07:49:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AZlsz3ZyjsIZz8eR411ulQJfdKLEvah6aEydcFf7i3g=; b=b4uypRMn3LzCB2TZOkW8fryCLb
 vJf/4TBPimfOYAy0aj0hLz+ru71LmYil6uSQUMK8ELo+QexGYh/+HaRkzV2ozBX0Mdv03frzE8za7
 Nbp6tPKsfekINBULUChrmlh8PA0IuvHCzcPdpylIrrNuRB0TICKlduN4SKRxWFNnjPu8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=AZlsz3ZyjsIZz8eR411ulQJfdKLEvah6aEydcFf7i3g=; b=cpQ3jWtzP4RvOQuhgSCta3ZFaZ
 soauhRIcZaOMvWiskTn4GDkVN6zynlkpSttntNYyVMLgumbP4K8BmL3PspleO5Oje6Qt0q+ut2bJh
 FX7nQ1aFo7DxcVTBFsj651K3jHCnjaPARZc9e8clf+aXh8yyVkqxYs1ffxjXT7+pPYjo=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pjxtp-00Fo4P-JP for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Apr 2023 07:49:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3651361F71;
 Wed,  5 Apr 2023 07:49:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 895D0C433D2;
 Wed,  5 Apr 2023 07:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680680979;
 bh=Weq5xIt7NaRy390+BxKr0DPL+Sx0J9wKSXtMC/5JUh0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=l5Flc0M5e8GB39z9f8BFJ5ebxS8y3KvMmKQItlraREhf8AkpnxMWHlz+JXp8p7uI1
 Kljlt0scTB58bQpEmq4GK+eEA+W3BOPA5cN1xWCrA68FuXwrY3GmcIErMd7I6tygyc
 V9JzsMXQMyO0n9SdIkQE39mGNJMhI4Juz/LKaq5zFFseVa5v/r1CJgL8buDMvRme/M
 V60YaWT3OGRM2C3c4p9BXErpUiMxTPWmcEsEkzEZBNsBmiLmJeuYqKxc6IXyHEJcg/
 oPvvLtbmc/+Gs5xXnYjOU/toIg6/1FGapaFmAgQB8BCmWBhC4ZrbJ8UgmFtFOJlHgF
 qh4BFYcRworMg==
Date: Wed, 5 Apr 2023 09:49:27 +0200
From: Christian Brauner <brauner@kernel.org>
To: Zorro Lang <zlang@kernel.org>
Message-ID: <20230405-bazillus-nanotechnologie-a8cf619d8454@brauner>
References: <20230404171411.699655-1-zlang@kernel.org>
 <20230404171411.699655-4-zlang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230404171411.699655-4-zlang@kernel.org>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Apr 05, 2023 at 01:14:09AM +0800, Zorro Lang wrote:
 > The fstests supports different kind of fs testing, better to cc > specific
 fs mailing list for specific fs testing, to get better > review [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pjxtp-00Fo4P-JP
Subject: Re: [f2fs-dev] [PATCH 3/5] fstests/MAINTAINERS: add supported
 mailing list
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
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org, ebiggers@google.com,
 djwong@kernel.org, amir73il@gmail.com, linux-unionfs@vger.kernel.org,
 fstests@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, fdmanana@suse.com, ocfs2-devel@oss.oracle.com,
 jack@suse.com, linux-fsdevel@vger.kernel.org, anand.jain@oracle.com,
 ceph-devel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Apr 05, 2023 at 01:14:09AM +0800, Zorro Lang wrote:
> The fstests supports different kind of fs testing, better to cc
> specific fs mailing list for specific fs testing, to get better
> reviewing points. So record these mailing lists and files related
> with them in MAINTAINERS file.
> 
> Signed-off-by: Zorro Lang <zlang@kernel.org>
> ---
> 
> If someone mailing list doesn't want to be in cc list of related fstests
> patch, please reply this email, I'll remove that line.
> 
> Or if I missed someone mailing list, please feel free to tell me.
> 
> Thanks,
> Zorro
> 
>  MAINTAINERS | 77 +++++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 77 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 09b1a5a3..620368cb 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -107,6 +107,83 @@ Maintainers List
>  	  should send patch to fstests@ at least. Other relevant mailing list
>  	  or reviewer or co-maintainer can be in cc list.
>  
> +BTRFS
> +L:	linux-btrfs@vger.kernel.org
> +S:	Supported
> +F:	tests/btrfs/
> +F:	common/btrfs
> +
> +CEPH
> +L:	ceph-devel@vger.kernel.org
> +S:	Supported
> +F:	tests/ceph/
> +F:	common/ceph
> +
> +CIFS
> +L:	linux-cifs@vger.kernel.org
> +S:	Supported
> +F:	tests/cifs
> +
> +EXT4
> +L:	linux-ext4@vger.kernel.org
> +S:	Supported
> +F:	tests/ext4/
> +F:	common/ext4
> +
> +F2FS
> +L:	linux-f2fs-devel@lists.sourceforge.net
> +S:	Supported
> +F:	tests/f2fs/
> +F:	common/f2fs
> +
> +FSVERITY
> +L:	fsverity@lists.linux.dev
> +S:	Supported
> +F:	common/verity
> +
> +FSCRYPT
> +L:      linux-fscrypt@vger.kernel.org
> +S:	Supported
> +F:	common/encrypt
> +
> +FS-IDMAPPED
> +L:	linux-fsdevel@vger.kernel.org
> +S:	Supported
> +F:	src/vfs/

Same suggestion as earlier, make that section VFS as it covers generic
functionality,

Acked-by: Christian Brauner <brauner@kernel.org>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
