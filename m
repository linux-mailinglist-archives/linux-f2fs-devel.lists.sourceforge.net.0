Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC372E9778
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  4 Jan 2021 15:42:30 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kwR3v-0006Vz-Lq; Mon, 04 Jan 2021 14:42:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <colin.king@canonical.com>) id 1kwR3u-0006Vb-7v
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 04 Jan 2021 14:42:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Date:Message-ID:Subject:From:Cc:To:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RGJ+RN3GL2xk7VXhq7pPX63eRyuzrdpoBxBi8CrZcs4=; b=G963fGSHihGfabzeky5ZkqE4HJ
 BpIcZ77epHdVSwxGOyiRnDlOBY0N0eK8R5/2Xo4XKbcn+0OxLygcMxP1MbOB3aJ6fSsDUbAGYCIM5
 +XHLOv1ZApOT8MXa+qLnUklVmcIDVLwwTNStkWMC0W+yh78ykbxM8jqjIqABAvAJ6k/c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Date:Message-ID:
 Subject:From:Cc:To:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=RGJ+RN3GL2xk7VXhq7pPX63eRyuzrdpoBxBi8CrZcs4=; b=l
 2CUM5HUavU6dU+LF37vmvEAGf+gOHiTogMxzoYk6B+sBgIpUlDKCTCxeIumpN3/9Y+F2hao1xPj6i
 yBTVVqaOQYD4tOCFtsoW0GWRvS1MrCR+O//QCZSJKoW/NmPo0c8QWgmDOHn8ev7CyI8bEob5idFFp
 wLeaajMFLrVJ0f7o=;
Received: from youngberry.canonical.com ([91.189.89.112])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-SHA:128) (Exim 4.92.2) id 1kwR3p-00C4RQ-Ll
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 04 Jan 2021 14:42:22 +0000
Received: from 1.general.cking.uk.vpn ([10.172.193.212])
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <colin.king@canonical.com>)
 id 1kwQml-0008BG-Tt; Mon, 04 Jan 2021 14:24:40 +0000
To: Daeho Jeong <daehojeong@google.com>
From: Colin Ian King <colin.king@canonical.com>
Message-ID: <1acf4202-e5e6-f3fb-73c3-11bc965d3058@canonical.com>
Date: Mon, 4 Jan 2021 14:24:39 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
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
X-Headers-End: 1kwR3p-00C4RQ-Ll
Subject: Re: [f2fs-dev] f2fs: add F2FS_IOC_DECOMPRESS_FILE and
 F2FS_IOC_COMPRESS_FILE
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi,

Static analysis using Coverity has detected a potential null pointer
dereference after a null check in the following commit:

commit 5fdb322ff2c2b4ad519f490dcb7ebb96c5439af7
Author: Daeho Jeong <daehojeong@google.com>
Date:   Thu Dec 3 15:56:15 2020 +0900

    f2fs: add F2FS_IOC_DECOMPRESS_FILE and F2FS_IOC_COMPRESS_FILE

The analysis is as follows:

4025 static int redirty_blocks(struct inode *inode, pgoff_t page_idx,
int len)
4026 {
4027        DEFINE_READAHEAD(ractl, NULL, inode->i_mapping, page_idx);
4028        struct address_space *mapping = inode->i_mapping;
4029        struct page *page;
4030        pgoff_t redirty_idx = page_idx;
4031        int i, page_len = 0, ret = 0;
4032
4033        page_cache_ra_unbounded(&ractl, len, 0);
4034

    1. Condition i < len, taking true branch.
    4. Condition i < len, taking true branch.

4035        for (i = 0; i < len; i++, page_idx++) {
4036                page = read_cache_page(mapping, page_idx, NULL, NULL);

    2. Condition IS_ERR(page), taking false branch.
    5. Condition IS_ERR(page), taking true branch.

4037                if (IS_ERR(page)) {
4038                        ret = PTR_ERR(page);

    6. Breaking from loop.

4039                        break;
4040                }
4041                page_len++;

    3. Jumping back to the beginning of the loop.

4042        }
4043

    7. Condition i < page_len, taking true branch.

4044        for (i = 0; i < page_len; i++, redirty_idx++) {
4045                page = find_lock_page(mapping, redirty_idx);

    8. Condition !page, taking true branch.
    9. var_compare_op: Comparing page to null implies that page might be
null.

4046                if (!page)
4047                        ret = -ENOENT;

Dereference after null check (FORWARD_NULL)

   10. var_deref_model: Passing null pointer page to set_page_dirty,
which dereferences it.

4048                set_page_dirty(page);
4049                f2fs_put_page(page, 1);
4050                f2fs_put_page(page, 0);
4051        }
4052
4053        return ret;
4054 }

The !page check on line 4046 sets ret appropriately but we have a
following call to set_page_dirty on a null page that causes the error.
Not sure how this should be fixed, should the check bail out immediately
or just avoid the following set_page_dirty anf f2fs_put_page calls?

Colin



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
