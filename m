Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B94639BBCCC
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  4 Nov 2024 19:03:11 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t81Pq-0008Dw-Ip;
	Mon, 04 Nov 2024 18:03:02 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1t81Pn-0008Db-RR
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 04 Nov 2024 18:02:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XrlGxeAxQIRjONh5DmYHR6Bi8gXK3gsqZm861p8ytLg=; b=TfjzaXX4gcbclxCaaVPkZFB2Qp
 Yj1CF72ZnAMR35uU+CCBpuMeZ7HLUhMAPuop+K/klbNQw8e/72MgfVLNrqyr8urg1SEJPk+ABn1vC
 zjs14pXmG0rJlM0qwmJNFoJxnRHoKOU4Na58vlUVvoQtzk5ZSQ0HbZYIr3WNq1KZyeMM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XrlGxeAxQIRjONh5DmYHR6Bi8gXK3gsqZm861p8ytLg=; b=XDTHjnaWATeGVpKi95LXlyWV1d
 Va37Sixy/82axQ9Y3vNAVD1jZYbdB51xJvZLDYxy6cv8zwqfAMCW6/3l3rBhq5MdPXbye82biu8r+
 +Q44HndBnigMZ8QyHfJCA8dahqMxzvTL/k3GxKilggm3wpLE2xbrhqwWsM0OwnSnmevw=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t81Pm-0005Uw-Mo for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 04 Nov 2024 18:02:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id A3AC4A43226;
 Mon,  4 Nov 2024 18:00:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39563C4CECE;
 Mon,  4 Nov 2024 18:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730743357;
 bh=yP3AzGld8FzxH9tOKTTB2o68WwDina53uBS0weY4OLs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nqfYcLrZDS69ybYADumbTjdNmAfqdeBwuYAUOic1Rj/10q6ggUWZLiDYkaCPK5aEH
 zmu4eoFdrAUYUyqH09b4NU313JKh+C+MQEQsFnA5/S8o13oZAoiRFCI0ipBp/CIHrD
 YYR8+oHSwIc4iDVej/js9QR02RkzVmrsSiipqECclpGLHtQIVef7t26FeafViOEBdl
 g59QyyQs5LNimTKrFAcd2N9fUvHgiInhDc8gbGEok4vZSEw9RJzDsGauezslhgF4Jt
 Un3HrYzRz3V3ubZQNfJ91sOIdTj3MsTjyaJG0bnzVO3UlO5jzUNETVnJiGJm8JQFgg
 eaDC1K1A+1PYA==
Date: Mon, 4 Nov 2024 18:02:35 +0000
To: "Darrick J. Wong" <djwong@kernel.org>
Message-ID: <20241104180235.GB1049313@google.com>
References: <20241103223154.136127-1-ebiggers@kernel.org>
 <20241103223154.136127-17-ebiggers@kernel.org>
 <20241104160136.GI21832@frogsfrogsfrogs>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241104160136.GI21832@frogsfrogsfrogs>
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Nov 04, 2024 at 08:01:36AM -0800, Darrick J. Wong
 wrote: > Same comment as my last reply about removing trivial helpers, but
 > otherwise > Reviewed-by: Darrick J. Wong <djwong@kernel.org> > > [...] 
 Content analysis details:   (-0.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t81Pm-0005Uw-Mo
Subject: Re: [f2fs-dev] [PATCH v3 16/18] jbd2: switch to using the crc32c
 library
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
From: Eric Biggers via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-mips@vger.kernel.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-crypto@vger.kernel.org, loongarch@lists.linux.dev,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-ext4@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Nov 04, 2024 at 08:01:36AM -0800, Darrick J. Wong wrote:
> Same comment as my last reply about removing trivial helpers, but
> otherwise
> Reviewed-by: Darrick J. Wong <djwong@kernel.org>
> 
> If you push this for 6.13 I'd be happy that the shash junk finally went
> away.  The onstack struct desc thing in the _chksum() functions was by
> far the most sketchy part of the ext4/jbd2 metadata csum project. :)

It will take a bit longer I'm afraid, since this patchset depends on patches
that are currently enqueued in three different trees for 6.13.  My current plan
is to target 6.14, and get this series into into linux-next shortly after the
6.13 merge window closes.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
