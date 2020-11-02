Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C169C2A2786
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  2 Nov 2020 10:55:38 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kZWYq-00056C-Iv; Mon, 02 Nov 2020 09:55:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <kitestramuort@autistici.org>) id 1kZWYo-00055n-Nm
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 02 Nov 2020 09:55:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Content-Type
 :References:In-Reply-To:Date:To:From:Subject:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QY6oP4rawOy8Rr6rQC1fDEqdbLhXeSoFD3eDUy6mTF8=; b=OiktcCFzuy7dqTX3MFFGZuH/WA
 AuMlmxXKG6gXVED2oD0xigez22XKgBoPJagO1N13d7Wj3fx8Ytn+abRiBJ/bApq/aPTTfShmgayvw
 WjAFWZyDZgjW1ctIhWMR4nOwi/z+kEPwlOBfJ+y0aMtQIJx9HTm59lvdSENxB2ZbzLtw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:
 In-Reply-To:Date:To:From:Subject:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QY6oP4rawOy8Rr6rQC1fDEqdbLhXeSoFD3eDUy6mTF8=; b=eIR09fIcCR0zMpI8joS3zoCSJY
 K9Ocmgn3wesyUOgy4rGBtyUVDcI3fZ4sCVCgqfvgYZFK3Hjb+ROrg5tj6IKprsvsn9wB/l2xEBo6g
 SgDCkdxqsEis5l2XbF07EptV5VHacMCKVnvagmA2R6GLpRCYbpMVHGhGLWyvY3F9EbF8=;
Received: from devianza.investici.org ([198.167.222.108])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kZWYd-006DhF-PI
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 02 Nov 2020 09:55:34 +0000
Received: from mx2.investici.org (unknown [127.0.0.1])
 by devianza.investici.org (Postfix) with ESMTP id 4CPpDt3RTHz6vLv;
 Mon,  2 Nov 2020 09:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=autistici.org;
 s=stigmate; t=1604310910;
 bh=QY6oP4rawOy8Rr6rQC1fDEqdbLhXeSoFD3eDUy6mTF8=;
 h=Subject:From:To:Date:In-Reply-To:References:From;
 b=YqdR6tk0Q1bw5vxW2JNJArMym/pidfWKYyXKMv/J9dXUQrbXvVYAWZvSVhuIcMuK2
 6mFwwTofcN4k3egzCA4HRlWLxZlpgk0z1L64P6JqHt9aGhi9LTOJC9cN7sCr+RXy9L
 zmsQnXnbi1Y7fy3QQKYKl/QWAdMjIeJlBKVh5owQ=
Received: from [198.167.222.108] (mx2.investici.org [198.167.222.108])
 (Authenticated sender: kitestramuort@autistici.org) by localhost (Postfix)
 with ESMTPSA id 4CPpDs4j6yz6vLn; 
 Mon,  2 Nov 2020 09:55:09 +0000 (UTC)
Message-ID: <af85cef0922ec28e4bc4171816c5816eb68927aa.camel@autistici.org>
From: kitestramuort <kitestramuort@autistici.org>
To: Chao Yu <yuchao0@huawei.com>, linux-f2fs-devel@lists.sourceforge.net
Date: Mon, 02 Nov 2020 10:55:07 +0100
In-Reply-To: <659d1796-82ef-b4dd-f933-1c1c0c19c31e@huawei.com>
References: <4c3d4693b7e60d6e87b6255986c9b21f42f58cf8.camel@autistici.org>
 <1c0ea7b6-73b5-9027-e67f-3dfff8e50855@huawei.com>
 <2a029c2ad9ae558adb5147be767329e542b20b50.camel@autistici.org>
 <ab249f17-0c0c-6a16-c38b-e0a702cd5223@huawei.com>
 <5d700f2a32e92ccef7e5925833c3893cc9bc0d2d.camel@autistici.org>
 <1433cdebc4d5b8c21dee3fddd1cc959ea82f6ab4.camel@autistici.org>
 <659d1796-82ef-b4dd-f933-1c1c0c19c31e@huawei.com>
User-Agent: Evolution 3.38.1 
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [198.167.222.108 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1kZWYd-006DhF-PI
Subject: Re: [f2fs-dev] Linux 5.10-rc1: F2FS-fs access invalid blkaddr
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, 2020-11-02 at 17:39 +0800, Chao Yu wrote:
> On 2020/10/31 17:09, kitestramuort wrote:
> > I believe that the error is triggered by the overlayfs. I use this
> > tool
> > to manage browsers' profiles in the tmpfs which uses Overlayfs
> > https://wiki.archlinux.org/index.php/Profile-sync-daemon
> 
> I found one case which can cause this incorrect report from llseek(),
> could you please have a try with patch I just sent?
> 
> [PATCH] f2fs: fix to seek incorrect data offset in inline data file
> 
> Thanks,


That fixes it. Thank you very much!



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
