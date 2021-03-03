Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A591732BA3F
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  3 Mar 2021 20:44:36 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lHXQ9-0006YI-RH; Wed, 03 Mar 2021 19:44:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1lHXQ8-0006Y6-Dx
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 03 Mar 2021 19:44:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=71DyLj2mo/SPRrenwGHRYb5z7tKhIfuc1ypDgqFmxHQ=; b=mZMUJ3SKUOtM3tTOZLYxlvKD7H
 VvTY4zHMzHqs0R97lpKjBvOusve0j9Fkz3kTsvhOiJEusUI0BJ9HjPm1ghm5vuWI5pvzuSd/g1LL/
 xwXPS+jbIKZfD030eGBXUl8rR2LlFVEmcVBeE85i+i+Nn/aHCTtKRBfGOSIGMKRw1Dmk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=71DyLj2mo/SPRrenwGHRYb5z7tKhIfuc1ypDgqFmxHQ=; b=JaooCw0WaA6x11o6TIY6GXKxMH
 AOc7zdP/zJGmYkDk8XW/TO8/TESa7RjuTQsXRKDMLWYWEDd3+iJ4+ht36Gv83tJTGx1Z4TeioWvmM
 V+4HMJl3czOZrVIXGEtOv2tNjkjrwFDNCb0zZha2w2+CErps0X2Q2f20Qv+ahW8yc3oc=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lHXQ5-00046o-DL
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 03 Mar 2021 19:44:32 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id BA10D64EEC;
 Wed,  3 Mar 2021 19:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614800664;
 bh=XzLN1itD6PL+bIg6U9jSAC+UFTtsG2NbdA80bYP7AMo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hmRt+HYGG544Fi2+h6mba4JSEU1BiziNRB2SVNBHJm0IDg2n5KjrEFNh+EulXG0Oa
 Xxh5to+8zCMYv+1NEO/IlAfC3b3aYf59esKN2VtD5X/FHbewG8X4bFzeeIA54xTCpi
 dJgIh4rWZ38s/zF7khf0XPyGTdfrf9HRti5P6ALJfLjQtWOZaMEf/RwbTMFCzpq6Jw
 TA3hKCEYf4ahb/8YxPB6HEnRUy/b++MBAInHSeA1UesBc3i9EiKwMOhAfoEjba7eTI
 YNymMrP8mB2wRzTrkrfxY92VbUhj3Wlo/GS3NsvlpQGxvPwlUfjy5TgmUmIvlSWfkg
 VAx+fxC0o8Bbg==
Date: Wed, 3 Mar 2021 11:44:22 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Colin Ian King <colin.king@canonical.com>
Message-ID: <YD/nFt6Gswnyogfa@google.com>
References: <9fcca081-9a60-8ae3-5cac-d8aa38c38ff2@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9fcca081-9a60-8ae3-5cac-d8aa38c38ff2@canonical.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lHXQ5-00046o-DL
Subject: Re: [f2fs-dev] f2fs_convert_inline_inode causing rebalance based on
 random uninitialized value in dn.node_changed
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
Cc: Changman Lee <cm224.lee@samsung.com>, Chao Yu <chao2.yu@samsung.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 03/02, Colin Ian King wrote:
> Hi,
> 
> Static analysis on linux-next detected a potential uninitialized
> variable dn.node_changed that does not get set when a call to
> f2fs_get_node_page() fails.  This uninitialized value gets used in the
> call to f2fs_balance_fs() that may or not may not balances dirty node
> and dentry pages depending on the uninitialized state of the variable.
> 
> I believe the issue was introduced by commit:
> 
> commit 2a3407607028f7c780f1c20faa4e922bf631d340
> Author: Jaegeuk Kim <jaegeuk@kernel.org>
> Date:   Tue Dec 22 13:23:35 2015 -0800
> 
>     f2fs: call f2fs_balance_fs only when node was changed
> 
> 
> The analysis is a follows:
> 
> 184 int f2fs_convert_inline_inode(struct inode *inode)
> 185 {
> 186        struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
> 
>    1. var_decl: Declaring variable dn without initializer.
> 
> 187        struct dnode_of_data dn;
> 
>    NOTE dn is not initialized here.
> 
> 188        struct page *ipage, *page;
> 189        int err = 0;
> 190
> 
>    2. Condition !f2fs_has_inline_data(inode), taking false branch.
>    3. Condition f2fs_hw_is_readonly(sbi), taking false branch.
>    4. Condition f2fs_readonly(sbi->sb), taking false branch.
> 
> 191        if (!f2fs_has_inline_data(inode) ||
> 192                        f2fs_hw_is_readonly(sbi) ||
> f2fs_readonly(sbi->sb))
> 193                return 0;
> 194
> 195        err = dquot_initialize(inode);
> 
>    5. Condition err, taking false branch.
> 
> 196        if (err)
> 197                return err;
> 198
> 199        page = f2fs_grab_cache_page(inode->i_mapping, 0, false);
> 
>    6. Condition !page, taking false branch.
> 
> 200        if (!page)
> 201                return -ENOMEM;
> 202
> 203        f2fs_lock_op(sbi);
> 204
> 205        ipage = f2fs_get_node_page(sbi, inode->i_ino);
> 
>    7. Condition IS_ERR(ipage), taking true branch.
> 
> 206        if (IS_ERR(ipage)) {
> 207                err = PTR_ERR(ipage);
> 
>    8. Jumping to label out.
> 
> 208                goto out;
> 209        }
> 210
> 
>    NOTE: set_new_dnode memset's dn so sets the flag to false, but we
> don't get to this memset if IS_ERR(ipage) above is true.
> 
> 211        set_new_dnode(&dn, inode, ipage, ipage, 0);
> 212
> 213        if (f2fs_has_inline_data(inode))
> 214                err = f2fs_convert_inline_page(&dn, page);
> 215
> 216        f2fs_put_dnode(&dn);
> 217 out:
> 218        f2fs_unlock_op(sbi);
> 219
> 220        f2fs_put_page(page, 1);
> 221
> 
> Uninitialized scalar variable:
> 
>    9. uninit_use_in_call: Using uninitialized value dn.node_changed when
> calling f2fs_balance_fs.
> 
> 222        f2fs_balance_fs(sbi, dn.node_changed);
> 223
> 224        return err;
> 225 }
> 
> I think a suitable fix will be to set dn.node_changed to false on in
> line 207-208 but I'm concerned if I'm missing something subtle to the
> rebalancing if I do this.
> 
> Comments?

Thank you for the report. Yes, it seems that's a right call and we need to
check the error to decide calling f2fs_balance_fs() in line 222, since
set_new_dnode() is used to set all the fields in dnode_of_data. So, if you
don't mind, could you please post a patch?

Thanks,

> 
> Colin
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
