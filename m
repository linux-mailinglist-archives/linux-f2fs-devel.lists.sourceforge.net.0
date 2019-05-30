Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AB1CF30262
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 30 May 2019 20:54:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hWQC5-0008If-Lu; Thu, 30 May 2019 18:54:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1hWQC4-0008IS-L3
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 30 May 2019 18:54:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qEBfqOmoJfCCNHsox+I6DyLNh/L3pJR20BPVb8zvS+o=; b=PvVcqJrzwxFm37fv1hPYO6sHNy
 QL3vZoNxtKCZrFb01P2GMZnWid+7a0dd+l+rpWO1zqudXvl210H33+7CD/T4GwLPl9pkSARBlVPn0
 YnvTKa8hqOKo3bNhAJjL5m3r/hz/F8dpfwJio+JBfCBa8tmiOoa/yLeacT8hkHUl7fL4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qEBfqOmoJfCCNHsox+I6DyLNh/L3pJR20BPVb8zvS+o=; b=OenC0TFd6x2os9g8q5U6/x2nIt
 4SZ4rcjoYkP9859uyNOMDcpXV/vQ+XMglRrD/7iGbmZ0svS1p8S9iJcwY6eSyRYSIKokk67hZpYOz
 cPIKuVkGQfsC0HX5NB/hq9DYwsMrVDul6mdaWW/md0ovoZSdBSLkWu0y+vWfntShesy4=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hWQC0-007VbV-In
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 30 May 2019 18:54:28 +0000
Received: from gmail.com (unknown [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1C5F224B6B;
 Thu, 30 May 2019 18:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1559242457;
 bh=q7K4pmGHUUBq3OOvKhZCDju5Yhxagmu1zFTfewcL3go=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dgpHrPpDfHfIKA83rjSp+ZqoKqKF9T0ncaTjYqKDrq0fEQLiRsrs1HHaz7osaMdge
 pqY3/OtH1zbLDA7nucMMijqsUXCYYBiapFM3Au60t/A0QrKOMGwxRssgOp+RDpcHFu
 wgDTyqudW+CCkNhybf2IbvoW0NMaCJVehv/Ek+Es=
Date: Thu, 30 May 2019 11:54:15 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Message-ID: <20190530185414.GD70051@gmail.com>
References: <20190523161811.6259-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190523161811.6259-1-ebiggers@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: 4.9 (++++)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 3.8 FSL_HELO_FAKE          No description available.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 T_DKIMWL_WL_HIGH       DKIMwl.org - Whitelisted High sender
 1.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hWQC0-007VbV-In
Subject: Re: [f2fs-dev] [PATCH v3 00/15] fs-verity: read-only file-based
 authenticity protection
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
Cc: "Theodore Y . Ts'o" <tytso@mit.edu>, linux-api@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-integrity@vger.kernel.org,
 linux-ext4@vger.kernel.org, Victor Hsieh <victorhsieh@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, May 23, 2019 at 09:17:56AM -0700, Eric Biggers wrote:
> Hello,
> 
> This is a redesigned version of the fs-verity patchset, implementing
> Ted's suggestion to build the Merkle tree in the kernel
> (https://lore.kernel.org/linux-fsdevel/20190207031101.GA7387@mit.edu/).

Does anyone have any comments on this patchset?

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
