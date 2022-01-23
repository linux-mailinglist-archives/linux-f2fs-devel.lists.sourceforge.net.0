Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A33497642
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Jan 2022 00:03:52 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nBltj-00049l-6N; Sun, 23 Jan 2022 23:03:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <david@fromorbit.com>) id 1nBlth-00049d-Mc
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 23 Jan 2022 23:03:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=L8TGXrScynZPHu6plAWa9V0VOsgSS8vgE8qt5Wa1P80=; b=jH3FwdO2fRS9UV0FWBvHc12uYq
 OqePV1pLxlD9nRDB+h7BqcKMQ9Mf16ga1uAmyGX434JSX76RkCO5zwYar+n9u5nNmSyiuW7+vYHHH
 MvDWsu08hu7O5l0zFk8NT3pBJe6PBAaHZ2hp9ju0SDt2uyjjYKhPFsq4yd07TPphxnqw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=L8TGXrScynZPHu6plAWa9V0VOsgSS8vgE8qt5Wa1P80=; b=QrZ/o3o9xFAguEFucgJw/BQmZg
 cpXfUM4DAhZRi2fi9LwbAmeiR2Jh/LGnQC0/F9e7WenFups8OTJYgdlz3jQx0pLX7B676hBbToklu
 eqzdv7kSG7FSxQ8XQih/dm2nXvtfxvKL+O9JkUCgKGK/ymstT3fZpTmK42YsOXAp4xMI=;
Received: from mail104.syd.optusnet.com.au ([211.29.132.246])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtp (Exim 4.92.3)
 id 1nBltc-009Tdh-TH
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 23 Jan 2022 23:03:44 +0000
Received: from dread.disaster.area (pa49-179-45-11.pa.nsw.optusnet.com.au
 [49.179.45.11])
 by mail104.syd.optusnet.com.au (Postfix) with ESMTPS id 2169362C1FD;
 Mon, 24 Jan 2022 10:03:34 +1100 (AEDT)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
 (envelope-from <david@fromorbit.com>)
 id 1nBltU-003QSN-Tk; Mon, 24 Jan 2022 10:03:32 +1100
Date: Mon, 24 Jan 2022 10:03:32 +1100
From: Dave Chinner <david@fromorbit.com>
To: "Darrick J. Wong" <djwong@kernel.org>
Message-ID: <20220123230332.GL59729@dread.disaster.area>
References: <20220120071215.123274-1-ebiggers@kernel.org>
 <YekdnxpeunTGfXqX@infradead.org> <20220120171027.GL13540@magnolia>
 <YenIcshA706d/ziV@sol.localdomain>
 <20220120210027.GQ13540@magnolia>
 <20220120220414.GH59729@dread.disaster.area>
 <Yenm1Ipx87JAlyXg@sol.localdomain>
 <20220120235755.GI59729@dread.disaster.area>
 <20220121023603.GH13563@magnolia>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220121023603.GH13563@magnolia>
X-Optus-CM-Score: 0
X-Optus-CM-Analysis: v=2.4 cv=e9dl9Yl/ c=1 sm=1 tr=0 ts=61eddec6
 a=Eslsx4mF8WGvnV49LKizaA==:117 a=Eslsx4mF8WGvnV49LKizaA==:17
 a=kj9zAlcOel0A:10 a=DghFqjY3_ZEA:10 a=7-415B0cAAAA:8
 a=ja5ArhmkF978jRwlfB8A:9 a=CjuIK1q_8ugA:10 a=biEYGPWJfzWAr4FL6Ov7:22
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Jan 20, 2022 at 06:36:03PM -0800, Darrick J. Wong
 wrote: > On Fri, Jan 21, 2022 at 10:57:55AM +1100, Dave Chinner wrote: > Sure.
 How's this? I couldn't think of a real case of directio > requi [...] 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [211.29.132.246 listed in list.dnswl.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
X-Headers-End: 1nBltc-009Tdh-TH
Subject: Re: [f2fs-dev] [PATCH v10 0/5] add support for direct I/O with
 fscrypt using blk-crypto
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
Cc: Christoph Hellwig <hch@infradead.org>, Theodore Ts'o <tytso@mit.edu>,
 linux-f2fs-devel@lists.sourceforge.net, Eric Biggers <ebiggers@kernel.org>,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org,
 linux-xfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Jan 20, 2022 at 06:36:03PM -0800, Darrick J. Wong wrote:
> On Fri, Jan 21, 2022 at 10:57:55AM +1100, Dave Chinner wrote:
> Sure.  How's this?  I couldn't think of a real case of directio
> requiring different alignments for pos and bytecount, so the only real
> addition here is the alignment requirements for best performance.
> 
> struct statx {
> ...
> 	/* 0x90 */
> 	__u64	stx_mnt_id;
> 
> 	/* Memory buffer alignment required for directio, in bytes. */
> 	__u32	stx_dio_mem_align;

	__32	stx_mem_align_dio;

(for consistency with suggestions below)

> 
> 	/* File range alignment required for directio, in bytes. */
> 	__u32	stx_dio_fpos_align_min;

"fpos" is not really a user term - "offset" is the userspace term for
file position, and it's much less of a random letter salad if it's
named that way. Also, we don't need "min" in the name; the
description of the field in the man page can give all the gory
details about it being the minimum required alignment.

	__u32	stx_offset_align_dio;

> 
> 	/* 0xa0 */
> 
> 	/* File range alignment needed for best performance, in bytes. */
> 	__u32	stx_dio_fpos_align_opt;

This is a common property of both DIO and buffered IO, so no need
for it to be dio-only property.

	__u32	stx_offset_align_optimal;

> 
> 	/* Maximum size of a directio request, in bytes. */
> 	__u32	stx_dio_max_iosize;

Unnecessary, it will always be the syscall max IO size, because the
internal DIO code will slice and dice it down to the max sizes the
hardware supports.

> #define STATX_DIRECTIO	0x00001000U	/* Want/got directio geometry */
> 
> How about that?

Mostly seems reasonable at a first look.

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
