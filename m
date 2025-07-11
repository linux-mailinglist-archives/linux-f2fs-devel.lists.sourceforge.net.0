Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF73B02190
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 11 Jul 2025 18:20:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6jpkyQW1KOMUZNJWLScCFxGsVHKWv0LbGiLoDwpitns=; b=LmDXF87E5+04SBYZo4jEC4Svvn
	fkuSNUvTTb1d8fp6ITJ9ANrdJKmTcUzY2uNwQ30Fi5jkjXGCGeRuUY5pwdrPbHa/hYsGMAX+eEnsA
	f4X16LYkIQC98K0U6g0INsNk50Ck/hCCvOSfM1NJC9kASIvGZjmLhc/5aibL+M0/SCJM=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uaGTt-0005jk-4p;
	Fri, 11 Jul 2025 16:20:13 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1uaGTp-0005jc-4y
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 11 Jul 2025 16:20:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hKwaWw/f/WA47jT4RfAsca/lu93Qbv6IywAxIqHwqb0=; b=LdU6aDdLJl0OQaL0a/J+mSohjD
 gFMQ4pdqsnOAE8eaYEskupYH/XHnCYgNzpbFGyipkHftk+5OyQTMN6iS3hPqtuCHTf64ADjroZ8PR
 /h3FlTwf2DoHSYXWKe31joGUfvC3mZ9YLrZ50n9c53Aw7Gy2J/R7Ie3m1UI5IKhc06K8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hKwaWw/f/WA47jT4RfAsca/lu93Qbv6IywAxIqHwqb0=; b=lSJZNh3cdELdpGW724m37OrMLl
 lnEe0cUGsLwT8ytwUTv9PcVJF+zNdbYgj31WAhbAy+2c3hXG4N1hu5Z3/oDPe4l14gUP5tQZf+Mty
 Tc8HMrtcjkArnNghFpgxDTCpdkUM5Yk4VJCgYA3qtJH0Kp8NPHrHCkN4G0U5JSNZPuIc=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uaGTn-0005rk-F1 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 11 Jul 2025 16:20:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id A2EA9A54F06;
 Fri, 11 Jul 2025 16:19:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A86EC4CEED;
 Fri, 11 Jul 2025 16:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752250796;
 bh=BgxcvwisK2gbVfms1JNegkldSDVPi8VSEzx8frIvRCA=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=s7GF1yxvfpPwsAXKg9IX0Zr1Ei8Ogvo3nfTkqBDTb4LjX6fywbKvjBk06eK37y80g
 EyqrHZeFLC/XUfxTQEjqe2MR++XOEps4j63fYc4ZIW62mF/XBXkQ1qa6bLcQwEZtPe
 +3RUiCwy+Z/nMM02rvNM07yXHwzq27mpUsxRV3ifiLBnT0SCF+scTyvsCIU1lUGfO7
 uu8xoWsYM/Nq1inRkIQOifDoPB9ZnB+tHdmCuGtEDwdL/rv79ilicdvD19Jqpcjs48
 Z0QP2PYZCxcLExmP9fIP+lr0sSAk9VVP6wDKYvqSn5wPZ9Luf+1+NrLuRcKDAqNwPX
 hTtcOPvsNaYjw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 70CC0383B275; Fri, 11 Jul 2025 16:20:19 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <175225081826.2325425.15124662064885879224.git-patchwork-notify@kernel.org>
Date: Fri, 11 Jul 2025 16:20:18 +0000
References: <20250708170359.111653-1-willy@infradead.org>
In-Reply-To: <20250708170359.111653-1-willy@infradead.org>
To: Matthew Wilcox <willy@infradead.org>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello: This series was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Tue, 8 Jul 2025 18:02:57 +0100 you wrote:
 > Some more folio conversions for f2fs. Again, I have checked these patches
 > build, but otherwise they are untested. There are three inline functions
 > in [...] 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uaGTn-0005rk-F1
Subject: Re: [f2fs-dev] [PATCH 00/60] f2fs folio conversions for 6.17
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
From: patchwork-bot+f2fs--- via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: patchwork-bot+f2fs@kernel.org
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This series was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Tue,  8 Jul 2025 18:02:57 +0100 you wrote:
> Some more folio conversions for f2fs.  Again, I have checked these patches
> build, but otherwise they are untested.  There are three inline functions
> in fscrypt that I change to take a const struct folio pointer instead
> of a mutable pointer that I don't think should cause any conflicts.
> 
> Matthew Wilcox (Oracle) (60):
>   f2fs: Pass a folio to recover_dentry()
>   f2fs: Pass a folio to recover_inode()
>   f2fs: Pass a folio to recover_quota_data()
>   f2fs: Pass a folio to f2fs_recover_inode_page()
>   f2fs: Pass a folio to sanity_check_extent_cache()
>   f2fs: Pass a folio to sanity_check_inode()
>   f2fs: Pass a folio to f2fs_sanity_check_inline_data()
>   f2fs: Pass a folio to inode_has_blocks()
>   f2fs: Pass a folio to F2FS_INODE()
>   f2fs: Pass a folio to ino_of_node()
>   f2fs: Pass a folio to nid_of_node()
>   f2fs: Pass a folio to is_recoverable_dnode()
>   f2fs: Pass a folio to set_dentry_mark()
>   f2fs: Pass a folio to set_fsync_mark()
>   f2fs: Pass a folio to set_mark()
>   f2fs: Pass a folio to f2fs_allocate_data_block()
>   f2fs: Pass a folio to f2fs_inode_chksum_set()
>   f2fs: Pass a folio to f2fs_enable_inode_chksum()
>   f2fs: Pass a folio to f2fs_inode_chksum()
>   f2fs: Pass a folio to fill_node_footer_blkaddr()
>   f2fs: Pass a folio to get_nid()
>   f2fs: Pass a folio to set_cold_node()
>   f2fs: Pass folios to copy_node_footer()
>   f2fs: Pass a folio to fill_node_footer()
>   f2fs: Pass a folio to cpver_of_node()
>   f2fs: Pass a folio to f2fs_recover_xattr_data()
>   f2fs: Pass a folio to is_fsync_dnode()
>   f2fs: Pass a folio to is_dent_dnode()
>   f2fs: Add fio->folio
>   f2fs: Use folio_unlock() in f2fs_write_compressed_pages()
>   f2fs: Pass a folio to is_cold_node()
>   f2fs: Pass a folio to is_node()
>   f2fs: Pass a folio to IS_DNODE()
>   f2fs: Pass a folio to ofs_of_node()
>   f2fs: Pass a folio to get_dnode_base()
>   f2fs: Pass a folio to ADDRS_PER_PAGE()
>   f2fs: Pass a folio to IS_INODE()
>   f2fs: Add folio counterparts to page_private_flags functions
>   f2fs: Use a folio in f2fs_is_cp_guaranteed()
>   f2fs: Convert set_page_private_data() to folio_set_f2fs_data()
>   f2fs: Convert get_page_private_data() to folio_get_f2fs_data()
>   f2fs: Pass a folio to f2fs_compress_write_end_io()
>   f2fs: Use a folio in f2fs_merge_page_bio()
>   f2fs: Use a bio in f2fs_submit_page_write()
>   f2fs: Pass a folio to WB_DATA_TYPE() and f2fs_is_cp_guaranteed()
>   f2fs: Use a folio iterator in f2fs_handle_step_decompress()
>   f2fs: Pass a folio to f2fs_end_read_compressed_page()
>   f2fs: Use a folio iterator in f2fs_verify_bio()
>   f2fs: Pass a folio to f2fs_is_compressed_page()
>   f2fs: Convert get_next_nat_page() to get_next_nat_folio()
>   f2fs: Pass the nat_blk to __update_nat_bits()
>   f2fs: Pass a folio to F2FS_NODE()
>   f2fs: Pass a folio to f2fs_cache_compressed_page()
>   f2fs: Use a folio in f2fs_encrypted_get_link()
>   f2fs: Use F2FS_F_SB() in f2fs_read_end_io()
>   f2fs: Remove clear_page_private_all()
>   f2fs: Remove use of page from f2fs_write_single_data_page()
>   f2fs: Pass a folio to f2fs_submit_merged_write_cond()
>   f2fs: Pass a folio to __has_merged_page()
>   f2fs: Remove F2FS_P_SB()
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,01/60] f2fs: Pass a folio to recover_dentry()
    (no matching commit)
  - [f2fs-dev,02/60] f2fs: Pass a folio to recover_inode()
    https://git.kernel.org/jaegeuk/f2fs/c/c038532a477a
  - [f2fs-dev,03/60] f2fs: Pass a folio to recover_quota_data()
    https://git.kernel.org/jaegeuk/f2fs/c/a1bde8f5df6b
  - [f2fs-dev,04/60] f2fs: Pass a folio to f2fs_recover_inode_page()
    https://git.kernel.org/jaegeuk/f2fs/c/e2f2fb439fe6
  - [f2fs-dev,05/60] f2fs: Pass a folio to sanity_check_extent_cache()
    https://git.kernel.org/jaegeuk/f2fs/c/f9119a6af7d6
  - [f2fs-dev,06/60] f2fs: Pass a folio to sanity_check_inode()
    https://git.kernel.org/jaegeuk/f2fs/c/7a9434457dbc
  - [f2fs-dev,07/60] f2fs: Pass a folio to f2fs_sanity_check_inline_data()
    https://git.kernel.org/jaegeuk/f2fs/c/169ba46764b8
  - [f2fs-dev,08/60] f2fs: Pass a folio to inode_has_blocks()
    https://git.kernel.org/jaegeuk/f2fs/c/0215fea1f4cd
  - [f2fs-dev,09/60] f2fs: Pass a folio to F2FS_INODE()
    (no matching commit)
  - [f2fs-dev,10/60] f2fs: Pass a folio to ino_of_node()
    (no matching commit)
  - [f2fs-dev,11/60] f2fs: Pass a folio to nid_of_node()
    (no matching commit)
  - [f2fs-dev,12/60] f2fs: Pass a folio to is_recoverable_dnode()
    https://git.kernel.org/jaegeuk/f2fs/c/b4940c4efbde
  - [f2fs-dev,13/60] f2fs: Pass a folio to set_dentry_mark()
    https://git.kernel.org/jaegeuk/f2fs/c/a99a7e725177
  - [f2fs-dev,14/60] f2fs: Pass a folio to set_fsync_mark()
    https://git.kernel.org/jaegeuk/f2fs/c/466e5479271d
  - [f2fs-dev,15/60] f2fs: Pass a folio to set_mark()
    https://git.kernel.org/jaegeuk/f2fs/c/1a3192164fbf
  - [f2fs-dev,16/60] f2fs: Pass a folio to f2fs_allocate_data_block()
    https://git.kernel.org/jaegeuk/f2fs/c/12a91837ab4b
  - [f2fs-dev,17/60] f2fs: Pass a folio to f2fs_inode_chksum_set()
    https://git.kernel.org/jaegeuk/f2fs/c/a47fe3490722
  - [f2fs-dev,18/60] f2fs: Pass a folio to f2fs_enable_inode_chksum()
    https://git.kernel.org/jaegeuk/f2fs/c/7a36693eecca
  - [f2fs-dev,19/60] f2fs: Pass a folio to f2fs_inode_chksum()
    https://git.kernel.org/jaegeuk/f2fs/c/28a1173b254c
  - [f2fs-dev,20/60] f2fs: Pass a folio to fill_node_footer_blkaddr()
    https://git.kernel.org/jaegeuk/f2fs/c/5e2c8ee61c4c
  - [f2fs-dev,21/60] f2fs: Pass a folio to get_nid()
    https://git.kernel.org/jaegeuk/f2fs/c/5477ebc936ba
  - [f2fs-dev,22/60] f2fs: Pass a folio to set_cold_node()
    https://git.kernel.org/jaegeuk/f2fs/c/d1462e1d6da6
  - [f2fs-dev,23/60] f2fs: Pass folios to copy_node_footer()
    https://git.kernel.org/jaegeuk/f2fs/c/911587da9698
  - [f2fs-dev,24/60] f2fs: Pass a folio to fill_node_footer()
    https://git.kernel.org/jaegeuk/f2fs/c/298185ddb37e
  - [f2fs-dev,25/60] f2fs: Pass a folio to cpver_of_node()
    https://git.kernel.org/jaegeuk/f2fs/c/4ff4b2ec087b
  - [f2fs-dev,26/60] f2fs: Pass a folio to f2fs_recover_xattr_data()
    https://git.kernel.org/jaegeuk/f2fs/c/e2080edee335
  - [f2fs-dev,27/60] f2fs: Pass a folio to is_fsync_dnode()
    https://git.kernel.org/jaegeuk/f2fs/c/94e3a713c77d
  - [f2fs-dev,28/60] f2fs: Pass a folio to is_dent_dnode()
    https://git.kernel.org/jaegeuk/f2fs/c/8e8b1174412d
  - [f2fs-dev,29/60] f2fs: Add fio->folio
    https://git.kernel.org/jaegeuk/f2fs/c/e6d648da79ac
  - [f2fs-dev,30/60] f2fs: Use folio_unlock() in f2fs_write_compressed_pages()
    https://git.kernel.org/jaegeuk/f2fs/c/9298fff61df3
  - [f2fs-dev,31/60] f2fs: Pass a folio to is_cold_node()
    https://git.kernel.org/jaegeuk/f2fs/c/48129aecd3f2
  - [f2fs-dev,32/60] f2fs: Pass a folio to is_node()
    https://git.kernel.org/jaegeuk/f2fs/c/14a59be90712
  - [f2fs-dev,33/60] f2fs: Pass a folio to IS_DNODE()
    https://git.kernel.org/jaegeuk/f2fs/c/11eab03afb9f
  - [f2fs-dev,34/60] f2fs: Pass a folio to ofs_of_node()
    https://git.kernel.org/jaegeuk/f2fs/c/7abab5d560b5
  - [f2fs-dev,35/60] f2fs: Pass a folio to get_dnode_base()
    https://git.kernel.org/jaegeuk/f2fs/c/60a03d2970d2
  - [f2fs-dev,36/60] f2fs: Pass a folio to ADDRS_PER_PAGE()
    https://git.kernel.org/jaegeuk/f2fs/c/a6023aa55a58
  - [f2fs-dev,37/60] f2fs: Pass a folio to IS_INODE()
    https://git.kernel.org/jaegeuk/f2fs/c/bd77898e0107
  - [f2fs-dev,38/60] f2fs: Add folio counterparts to page_private_flags functions
    https://git.kernel.org/jaegeuk/f2fs/c/fbb435125cca
  - [f2fs-dev,39/60] f2fs: Use a folio in f2fs_is_cp_guaranteed()
    (no matching commit)
  - [f2fs-dev,40/60] f2fs: Convert set_page_private_data() to folio_set_f2fs_data()
    https://git.kernel.org/jaegeuk/f2fs/c/916bb5e96244
  - [f2fs-dev,41/60] f2fs: Convert get_page_private_data() to folio_get_f2fs_data()
    https://git.kernel.org/jaegeuk/f2fs/c/6fc43b4e972f
  - [f2fs-dev,42/60] f2fs: Pass a folio to f2fs_compress_write_end_io()
    https://git.kernel.org/jaegeuk/f2fs/c/091d80074ab3
  - [f2fs-dev,43/60] f2fs: Use a folio in f2fs_merge_page_bio()
    https://git.kernel.org/jaegeuk/f2fs/c/a8c4d9d6fdfb
  - [f2fs-dev,44/60] f2fs: Use a bio in f2fs_submit_page_write()
    https://git.kernel.org/jaegeuk/f2fs/c/3c488b757c16
  - [f2fs-dev,45/60] f2fs: Pass a folio to WB_DATA_TYPE() and f2fs_is_cp_guaranteed()
    https://git.kernel.org/jaegeuk/f2fs/c/28e953cb10e1
  - [f2fs-dev,46/60] f2fs: Use a folio iterator in f2fs_handle_step_decompress()
    https://git.kernel.org/jaegeuk/f2fs/c/7f73ce73878f
  - [f2fs-dev,47/60] f2fs: Pass a folio to f2fs_end_read_compressed_page()
    https://git.kernel.org/jaegeuk/f2fs/c/7c5a2227a140
  - [f2fs-dev,48/60] f2fs: Use a folio iterator in f2fs_verify_bio()
    https://git.kernel.org/jaegeuk/f2fs/c/aca3b805617a
  - [f2fs-dev,49/60] f2fs: Pass a folio to f2fs_is_compressed_page()
    https://git.kernel.org/jaegeuk/f2fs/c/ce45b989aeb9
  - [f2fs-dev,50/60] f2fs: Convert get_next_nat_page() to get_next_nat_folio()
    https://git.kernel.org/jaegeuk/f2fs/c/0b3ae6d0b81d
  - [f2fs-dev,51/60] f2fs: Pass the nat_blk to __update_nat_bits()
    https://git.kernel.org/jaegeuk/f2fs/c/ad5f8969ac99
  - [f2fs-dev,52/60] f2fs: Pass a folio to F2FS_NODE()
    https://git.kernel.org/jaegeuk/f2fs/c/db80d3671da9
  - [f2fs-dev,53/60] f2fs: Pass a folio to f2fs_cache_compressed_page()
    https://git.kernel.org/jaegeuk/f2fs/c/73c677af3f97
  - [f2fs-dev,54/60] f2fs: Use a folio in f2fs_encrypted_get_link()
    https://git.kernel.org/jaegeuk/f2fs/c/8002c3e20bbb
  - [f2fs-dev,55/60] f2fs: Use F2FS_F_SB() in f2fs_read_end_io()
    https://git.kernel.org/jaegeuk/f2fs/c/ec555507df88
  - [f2fs-dev,56/60] f2fs: Remove clear_page_private_all()
    https://git.kernel.org/jaegeuk/f2fs/c/c1d6bee2e291
  - [f2fs-dev,57/60] f2fs: Remove use of page from f2fs_write_single_data_page()
    https://git.kernel.org/jaegeuk/f2fs/c/daedff70249f
  - [f2fs-dev,58/60] f2fs: Pass a folio to f2fs_submit_merged_write_cond()
    https://git.kernel.org/jaegeuk/f2fs/c/bc2b45b9e752
  - [f2fs-dev,59/60] f2fs: Pass a folio to __has_merged_page()
    https://git.kernel.org/jaegeuk/f2fs/c/16b7cb4d2354
  - [f2fs-dev,60/60] f2fs: Remove F2FS_P_SB()
    https://git.kernel.org/jaegeuk/f2fs/c/9a8ab51aecda

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
