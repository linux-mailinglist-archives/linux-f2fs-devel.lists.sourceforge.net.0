Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A6F32AB04
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  2 Mar 2021 21:07:28 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lHBIk-0006xz-Gf; Tue, 02 Mar 2021 20:07:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <colin.king@canonical.com>) id 1lHBIi-0006xr-QX
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 02 Mar 2021 20:07:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Date:Message-ID:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NeTlkZk3hI/k7ou7Q2bN5AgN3kOgCc096l4kbFtHQP8=; b=d2+5ZGp7aFMkJrVuyhSG4+ylZ/
 Kqi6pJtEC/0QPQFfEqfWSt8RQrtSKI3DLiP/zyUZcjBcFtB3mBOK4hUeOWiBh+GUA2f8D3nqflwmd
 2Rqp4JRWfZMvt7A9pRqD/hp9DYZhiaY50tlGgctZJ8g9ihc8E9dokUMRLL99BjFpKvWA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Date:Message-ID:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=NeTlkZk3hI/k7ou7Q2bN5AgN3kOgCc096l4kbFtHQP8=; b=l
 CYNB05nI6jDUEpzZctSda/sBMzyf14N/glVxCjOrNtAymDJhMaTAARlfZxQhrOj462gRvkzEDg4P+
 4+AwzjXCUw8lgIrEy2SMxUa89+6jfk9eDdqLZl8qsLWYT1hVV1J7J4IwVVp1NDEygshAQhkMH6Rbg
 qbHVLmCa/PKHO7AM=;
Received: from youngberry.canonical.com ([91.189.89.112])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-SHA:128) (Exim 4.92.2) id 1lHBIa-00Be8x-Mt
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 02 Mar 2021 20:07:24 +0000
Received: from 1.general.cking.uk.vpn ([10.172.193.212])
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <colin.king@canonical.com>)
 id 1lHBIT-0008BB-AE; Tue, 02 Mar 2021 20:07:09 +0000
From: Colin Ian King <colin.king@canonical.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Changman Lee <cm224.lee@samsung.com>,
 Chao Yu <chao2.yu@samsung.com>, linux-f2fs-devel@lists.sourceforge.net
Message-ID: <9fcca081-9a60-8ae3-5cac-d8aa38c38ff2@canonical.com>
Date: Tue, 2 Mar 2021 20:07:08 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
Content-Language: en-US
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [91.189.89.112 listed in wl.mailspike.net]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1lHBIa-00Be8x-Mt
Subject: [f2fs-dev] f2fs_convert_inline_inode causing rebalance based on
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi,

Static analysis on linux-next detected a potential uninitialized
variable dn.node_changed that does not get set when a call to
f2fs_get_node_page() fails.  This uninitialized value gets used in the
call to f2fs_balance_fs() that may or not may not balances dirty node
and dentry pages depending on the uninitialized state of the variable.

I believe the issue was introduced by commit:

commit 2a3407607028f7c780f1c20faa4e922bf631d340
Author: Jaegeuk Kim <jaegeuk@kernel.org>
Date:   Tue Dec 22 13:23:35 2015 -0800

    f2fs: call f2fs_balance_fs only when node was changed


The analysis is a follows:

184 int f2fs_convert_inline_inode(struct inode *inode)
185 {
186        struct f2fs_sb_info *sbi = F2FS_I_SB(inode);

   1. var_decl: Declaring variable dn without initializer.

187        struct dnode_of_data dn;

   NOTE dn is not initialized here.

188        struct page *ipage, *page;
189        int err = 0;
190

   2. Condition !f2fs_has_inline_data(inode), taking false branch.
   3. Condition f2fs_hw_is_readonly(sbi), taking false branch.
   4. Condition f2fs_readonly(sbi->sb), taking false branch.

191        if (!f2fs_has_inline_data(inode) ||
192                        f2fs_hw_is_readonly(sbi) ||
f2fs_readonly(sbi->sb))
193                return 0;
194
195        err = dquot_initialize(inode);

   5. Condition err, taking false branch.

196        if (err)
197                return err;
198
199        page = f2fs_grab_cache_page(inode->i_mapping, 0, false);

   6. Condition !page, taking false branch.

200        if (!page)
201                return -ENOMEM;
202
203        f2fs_lock_op(sbi);
204
205        ipage = f2fs_get_node_page(sbi, inode->i_ino);

   7. Condition IS_ERR(ipage), taking true branch.

206        if (IS_ERR(ipage)) {
207                err = PTR_ERR(ipage);

   8. Jumping to label out.

208                goto out;
209        }
210

   NOTE: set_new_dnode memset's dn so sets the flag to false, but we
don't get to this memset if IS_ERR(ipage) above is true.

211        set_new_dnode(&dn, inode, ipage, ipage, 0);
212
213        if (f2fs_has_inline_data(inode))
214                err = f2fs_convert_inline_page(&dn, page);
215
216        f2fs_put_dnode(&dn);
217 out:
218        f2fs_unlock_op(sbi);
219
220        f2fs_put_page(page, 1);
221

Uninitialized scalar variable:

   9. uninit_use_in_call: Using uninitialized value dn.node_changed when
calling f2fs_balance_fs.

222        f2fs_balance_fs(sbi, dn.node_changed);
223
224        return err;
225 }

I think a suitable fix will be to set dn.node_changed to false on in
line 207-208 but I'm concerned if I'm missing something subtle to the
rebalancing if I do this.

Comments?

Colin




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
