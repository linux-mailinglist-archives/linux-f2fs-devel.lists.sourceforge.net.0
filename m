Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6975B66378C
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Jan 2023 03:55:52 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pF4ni-00086K-Vy;
	Tue, 10 Jan 2023 02:55:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <akpm@linux-foundation.org>) id 1pF4ng-00086A-R0
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Jan 2023 02:55:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Mime-Version
 :References:In-Reply-To:Message-Id:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JMNXsPxYhVKORIJezaHqnFFRc7qB+CERUFEvx8HBmPI=; b=aCbIpqZXfLst85kNQK5H0feaBg
 XrQetdS3WGzJVzb/EwlOKC8g27lwyMbniwvIZkFv2meWs2QcaDtd0zqL1CiKPPrlpkSeF/0Ccnrsl
 9iwUsjN9rQZifaeahJmzZ5gYaOnQ77QU1Ma79UlDpHcyqfxz3Nf7peZazdYHQW9L96tI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Mime-Version:References:
 In-Reply-To:Message-Id:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JMNXsPxYhVKORIJezaHqnFFRc7qB+CERUFEvx8HBmPI=; b=it2YiCDj0guSL+9RboiUNRd48K
 ZEhwyZH+omCdoE0LsCRvijbw2NmzFA1qoJcbiBg/UonjWwlS3uRfOp8mZMkrYQ4zYuHX5M4VmAKWv
 ydlpJ8fO3H3mXU5emAqVTfT72OgdMtbSUASEL1XwyGktV3qcxXzyq8GkN/ZjoOrZ9xQI=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pF4nZ-00CNJF-P8 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Jan 2023 02:55:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BB7DC614B4;
 Tue, 10 Jan 2023 02:38:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A862CC433EF;
 Tue, 10 Jan 2023 02:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1673318281;
 bh=Y64MR4JK48Pzp25aGh8zQ5wqMuidq5kQnWPvb8e5i9I=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=cEgGQa5zyUoGHgJLglyternN0KDprFlgUCd6BKIvxiD2upcGonWYYLG4H/yh6Ywbg
 mhfo1DGbQOmqUd8qvuzP76ikYLMkESZ1gih+2voSna2iJrFiRvv6jIDGac5HZ6dRo/
 9yjcHwGTRnn5HHiw2V0ZuL50gw2Z3KriC6g3L4ro=
Date: Mon, 9 Jan 2023 18:37:59 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Eric Biggers <ebiggers@kernel.org>
Message-Id: <20230109183759.c1e469f5f2181e9988f10131@linux-foundation.org>
In-Reply-To: <20221223203638.41293-11-ebiggers@kernel.org>
References: <20221223203638.41293-1-ebiggers@kernel.org>
 <20221223203638.41293-11-ebiggers@kernel.org>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri,
 23 Dec 2022 12:36:37 -0800 Eric Biggers <ebiggers@kernel.org>
 wrote: > After each filesystem block (as represented by a buffer_head) has
 been > read from disk by block_read_full_folio(), verify it if needed. The
 > verification is done on the fsverity_read_workqueue. Al [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
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
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1pF4nZ-00CNJF-P8
Subject: Re: [f2fs-dev] [PATCH v2 10/11] fs/buffer.c: support fsverity in
 block_read_full_folio()
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
Cc: Andrey Albershteyn <aalbersh@redhat.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, 23 Dec 2022 12:36:37 -0800 Eric Biggers <ebiggers@kernel.org> wrote:

> After each filesystem block (as represented by a buffer_head) has been
> read from disk by block_read_full_folio(), verify it if needed.  The
> verification is done on the fsverity_read_workqueue.  Also allow reads
> of verity metadata past i_size, as required by ext4.

Sigh.  Do we reeeeealy need to mess with buffer.c in this fashion?  Did
any other subsystems feel a need to do this?

> This is needed to support fsverity on ext4 filesystems where the
> filesystem block size is less than the page size.

Does any real person actually do this?


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
