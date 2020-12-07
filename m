Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE3A2D0B1B
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  7 Dec 2020 08:29:06 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kmAxB-0004wg-Tr; Mon, 07 Dec 2020 07:29:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1kmAxA-0004wF-Nv
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 07 Dec 2020 07:29:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xssgPHeMTAo4K6R4jN7ETP4Q6QWs4ur+getv3Nc7VYo=; b=F4BkKzpbgnswCrPR7XNswmuYx4
 wsoyN9dXLnvkEAJP2Nu2GWzKtpnR7qrCGPSfTLErbSOm2tXKBe82l+UWo7rZBnexb9lBzSmZh7csm
 dFgcR/V2apWDzycCAtWqSJvF8vHrTpaXFV1VazZ3UQlE2Ef7y54n9VDeqSlacJeo6ZKQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xssgPHeMTAo4K6R4jN7ETP4Q6QWs4ur+getv3Nc7VYo=; b=B5tYSXBrnPwQU8T+yefJs3Smvv
 71AF87hUuM0wVKpFJkJy6yuNu2EAJvYA386AZwJ+Jn+6z5IEYYedsZoFw6eiCOPWvvKSrL+Cla38H
 LdqUdUzL0n1pDYXTFITug9abu7q/OKRErTaMlrTNaOnS3WWgFroaRl7zTa0sR4eCa09g=;
Received: from mail-lj1-f182.google.com ([209.85.208.182])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kmAwv-0054SE-My
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 07 Dec 2020 07:29:00 +0000
Received: by mail-lj1-f182.google.com with SMTP id o24so13890844ljj.6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 06 Dec 2020 23:28:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xssgPHeMTAo4K6R4jN7ETP4Q6QWs4ur+getv3Nc7VYo=;
 b=RVBYcnQxwT/pyLzbrXk4X8TqpF8sst1fcXHN1zeAh9yFuAOusAum/OOyqoIeeiblxe
 99g3ymYK0jfqG1541u3I2AuHqe6NeWXjSJt2YjTQj+NohRfnxu76dySCvHEhMR2SWEIr
 74WHfOZq+r4b+EWTe4P0DAQ3K/OHVXwXTyMypif/XzYCBV+Te3d3vSeY7ulCBq1jVvuM
 Zridh148X/G2RFMuinQndxF9GmFKYXcpSbqfb7EttjNDirTWBN+ZMdJj49PbHBRrzyBa
 zRspjgpEihHTPm9OgU9RZVpWV3aojQfAJHIKFvcEqT/8kGaGkDEE/FvtGXvVrwUhPN16
 03JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xssgPHeMTAo4K6R4jN7ETP4Q6QWs4ur+getv3Nc7VYo=;
 b=VutnYil42khFZFKQvKaknQEAhkNe39XU+Q/IKLkcUMjIyDGe9/JNDS6rA8q5IlGE0j
 wOL0r1+zymbZyknb5XJ5Ygc0OgoHvDWgOdA2xcHy/h31gRJU+uEVenpzIPCml7v24QQm
 HrtMErydjexgBDuf1s3trLC4YGO2TSboUmyUKrPpwQpeb4ufQVEc6uktQmKiHYxb5Fef
 UPBMHr5AyVLDEdxVyAa7jOV0aGU8nWFZO//LDrOIac1IRUzBISoDSTXtPu8xWaomUnpT
 D5i7zFvM+PjQiMqFGBtQGK0CV/RYYunySeK41VXLYx3bKo7mnBp2kklDVCDSsRqIwlMO
 Ogzg==
X-Gm-Message-State: AOAM531T4oBL9oi0P5S0Etck44sNRUlF+o5htJJFkVDK1vYOPeA6aVzg
 fV8oz/eU4xf+Ekyyo4M/Hgf+Rthsh3zgmxtbkw0=
X-Google-Smtp-Source: ABdhPJxzPJi4K7+p3JPjqKY/jWGalH0s5b2CuMKAaiB334oGPBo/t+1qeWzUEJPowrS0ap4PYOUUh5lEWBFsJOGaVrQ=
X-Received: by 2002:a2e:bc16:: with SMTP id b22mr8595524ljf.166.1607326119032; 
 Sun, 06 Dec 2020 23:28:39 -0800 (PST)
MIME-Version: 1.0
References: <20201205042626.1113600-1-daeho43@gmail.com>
 <c3c41d53-2a99-17a2-223a-3d674613a417@huawei.com>
In-Reply-To: <c3c41d53-2a99-17a2-223a-3d674613a417@huawei.com>
From: Daeho Jeong <daeho43@gmail.com>
Date: Mon, 7 Dec 2020 16:28:28 +0900
Message-ID: <CACOAw_zwbmYHbUVUmzGMci9SaSVSrP8NXXavHBSSLxbAEOrMcw@mail.gmail.com>
To: Chao Yu <yuchao0@huawei.com>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.182 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.208.182 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (daeho43[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1kmAwv-0054SE-My
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: fix race of pending_pages in
 decompression
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, Daeho Jeong <daehojeong@google.com>,
 kernel-team@android.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

> It looks like it will be better to move this into merge condition?
>
>                 if (bio && (!page_is_mergeable(sbi, bio,
>                                         *last_block_in_bio, blkaddr) ||
>                     !f2fs_crypt_mergeable_bio(bio, inode, page->index, NULL) ||
>                         f2fs_verify_mergeable_bio())) {
>

I tried this for the first time, but it requires unnecessary checks
within the compression cluster.
I wanted to just check one time in the beginning of the cluster.
What do you think?


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
