Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D826D78A3C3
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 28 Aug 2023 03:05:23 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qaQgu-0000of-Mu;
	Mon, 28 Aug 2023 01:05:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <viro@ftp.linux.org.uk>) id 1qaQgp-0000oD-Dn
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Aug 2023 01:05:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Sender:In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=joEHMg4Vnx51INzte3pGka01/tHMgi/viw3PIuubDEg=; b=b4tj1PZXYAv+Ud/k+qye1YcH0u
 GOLOaZ5FrCDOSavrPJ9Pty+c3BpCdK3/zgxPjN0dTerXYuYshXHpeRW/x4DV2zLPtDCkfiFd0BQb1
 Z9Y58TevGeYxyRNjF+w/LZi9xDUc5BS6Wgu7Jz8mAx6OiFmPKCfoMQ54NEALKL56j+Vs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Sender:In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=joEHMg4Vnx51INzte3pGka01/tHMgi/viw3PIuubDEg=; b=YxPv77zvDiZhf6zwNIr8nP9uGm
 0SHEoViqlNwpfc6DHwnHhWbxY5fDWMZaoAnEgX22natWfkXgEdTXlfLciQ3FtyW/5xAn51okORS5n
 MCDu6iB72EvRJqADooOQcpTQbSguU1RO6/yydVFYueC6vzoxKjIXCMzdO9/ZgWAVk9sg=;
Received: from zeniv.linux.org.uk ([62.89.141.173])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qaQgn-0003wx-5i for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Aug 2023 01:05:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=joEHMg4Vnx51INzte3pGka01/tHMgi/viw3PIuubDEg=; b=tBQRCz5+oVdl3BS/sNcy7bWOX7
 GGqnD2dBYFuddcCAHCZIxNjDzAdi2le5BAt0r8Kntb7pX1JY0YphckowafjvL81vNIQ3iZbSuHB8W
 r/PUBBhyIh5zGyiYSh551Ab8m+qrDF3vUESvq5gmF+156kAmT5ewUZLVGI0pVuCR+wxckZ4BuuSiW
 RJFEDzRbT6/CwsUyBB67HLFUFCa0gDIENAIc4MS7fD/7hjHRH/QwT9ZGKRpKtatGkE8elHlNUeY9H
 K7XCyGgu0m99e9gG1KyKu8v/0XPiv+PZlDfNvSozoVu79X3N9xA7HRVP+E5Pt/Irs6JBUgQAoXzdY
 9136hnSA==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1qaQgN-001R4E-2B; Mon, 28 Aug 2023 01:04:43 +0000
Date: Mon, 28 Aug 2023 02:04:43 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20230828010443.GV3390869@ZenIV>
References: <20230601145904.1385409-1-hch@lst.de>
 <20230601145904.1385409-4-hch@lst.de>
 <20230827194122.GA325446@ZenIV>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230827194122.GA325446@ZenIV>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sun, Aug 27, 2023 at 08:41:22PM +0100, Al Viro wrote: >
 That part is somewhat fishy - there's a case where you return a positive
 value > and advance ->ki_pos by more than that amount. I really wonder if
 all callers > of ->write_iter() are OK with that. 
 Content analysis details:   (-0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1qaQgn-0003wx-5i
Subject: Re: [f2fs-dev] [PATCH 03/12] filemap: update ki_pos in
 generic_perform_write
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
Cc: "Darrick J. Wong" <djwong@kernel.org>, linux-mm@kvack.org,
 Andreas Gruenbacher <agruenba@redhat.com>, Miklos Szeredi <miklos@szeredi.hu>,
 Matthew Wilcox <willy@infradead.org>, cluster-devel@redhat.com,
 Ilya Dryomov <idryomov@gmail.com>, linux-ext4@vger.kernel.org,
 linux-nfs@vger.kernel.org, linux-block@vger.kernel.org,
 Damien Le Moal <dlemoal@kernel.org>, Hannes Reinecke <hare@suse.de>,
 Jaegeuk Kim <jaegeuk@kernel.org>, ceph-devel@vger.kernel.org,
 Xiubo Li <xiubli@redhat.com>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Jens Axboe <axboe@kernel.dk>, Christian Brauner <brauner@kernel.org>,
 Theodore Ts'o <tytso@mit.edu>, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, Anna Schumaker <anna@kernel.org>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Sun, Aug 27, 2023 at 08:41:22PM +0100, Al Viro wrote:

> That part is somewhat fishy - there's a case where you return a positive value
> and advance ->ki_pos by more than that amount.  I really wonder if all callers
> of ->write_iter() are OK with that.

Speaking of which, in case of negative return value we'd better *not* use
->ki_pos; consider e.g. generic_file_write_iter() with O_DSYNC and
vfs_fsync_range() failure.  An error gets returned, but ->ki_pos is left
advanced.  Normal write(2) is fine - it will only update file->f_pos if
->write_iter() has returned a non-negative.  However, io_uring
kiocb_done() starts with
        if (req->flags & REQ_F_CUR_POS)
                req->file->f_pos = rw->kiocb.ki_pos;
        if (ret >= 0 && (rw->kiocb.ki_complete == io_complete_rw)) {
                if (!__io_complete_rw_common(req, ret)) {
                        /*
                         * Safe to call io_end from here as we're inline
                         * from the submission path.
                         */
                        io_req_io_end(req);
                        io_req_set_res(req, final_ret,
                                       io_put_kbuf(req, issue_flags));
                        return IOU_OK;
                }
        } else {
                io_rw_done(&rw->kiocb, ret);
        }
Note that ->f_pos update is *NOT* conditional upon ret >= 0 - it happens
no matter what, provided that original request had ->kiocb.ki_pos equal
to -1 (on a non-FMODE_STREAM file).

Jens, is there any reason for doing that unconditionally?  IMO it's
a bad idea - there's a wide scope for fuckups that way, especially
since write(2) is not sensitive to that and this use of -1 ki_pos
is not particularly encouraged on io_uring side either, AFAICT.
Worse, it's handling of failure exits in the first place, which
already gets little testing...


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
