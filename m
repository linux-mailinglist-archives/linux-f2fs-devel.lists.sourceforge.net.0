Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E3D5F0D00
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  6 Nov 2019 04:26:46 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iSBxw-0001w5-B6; Wed, 06 Nov 2019 03:26:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <tytso@mit.edu>) id 1iSBxu-0001vx-CH
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 06 Nov 2019 03:26:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eXbTkeLLTPq/is4OmaGJiGnD1qywzbvGYR1C77mghk8=; b=NpqFoU35eXEonOzqPA3btRrsfM
 KUqYszDvBG1NaCmRHQF6eZvQgyc+LP0A2/VJgCZwsdiwjz0h955g6KeFiA629KsUy5lTAl2wNaehq
 8EP5LJyzK+JlPg0xeNYVVv3NxCelMEjxB2gKwHjQa9RGtoWTW8FRbElTUTZH8g4LhEgs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=eXbTkeLLTPq/is4OmaGJiGnD1qywzbvGYR1C77mghk8=; b=C39KwedCcxvBSBshWX5zCOZQ1B
 /3nN6wzzp71xkjChLsjDcCW6bQGoSyziAHNqTA15OfgDvonSSt+NQcy2hajVk7n/XRFdmfV5F9XX+
 RDAydiK9AtMVpQ2y9/0RF1YKFfZvQVdgOBFl+bfeAB7YQ/f3Y8j3Q033/Y0CRgBLWbCc=;
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iSBxq-002GyT-DX
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 06 Nov 2019 03:26:38 +0000
Received: from callcc.thunk.org (ip-12-2-52-196.nyc.us.northamericancoax.com
 [196.52.2.12]) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id xA63QMGp027897
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 5 Nov 2019 22:26:23 -0500
Received: by callcc.thunk.org (Postfix, from userid 15806)
 id 4AC21420311; Tue,  5 Nov 2019 22:26:20 -0500 (EST)
Date: Tue, 5 Nov 2019 22:26:20 -0500
From: "Theodore Y. Ts'o" <tytso@mit.edu>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20191106032620.GF26959@mit.edu>
References: <20191024215438.138489-1-ebiggers@kernel.org>
 <20191024215438.138489-3-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191024215438.138489-3-ebiggers@kernel.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iSBxq-002GyT-DX
Subject: Re: [f2fs-dev] [PATCH v2 2/3] ext4: add support for IV_INO_LBLK_64
 encryption policies
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
Cc: linux-f2fs-devel@lists.sourceforge.net, Satya Tangirala <satyat@google.com>,
 Paul Lawrence <paullawrence@google.com>, linux-fscrypt@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org, Paul Crowley <paulcrowley@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Oct 24, 2019 at 02:54:37PM -0700, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> IV_INO_LBLK_64 encryption policies have special requirements from the
> filesystem beyond those of the existing encryption policies:
> 
> - Inode numbers must never change, even if the filesystem is resized.
> - Inode numbers must be <= 32 bits.
> - File logical block numbers must be <= 32 bits.
> 
> ext4 has 32-bit inode and file logical block numbers.  However,
> resize2fs can re-number inodes when shrinking an ext4 filesystem.
> 
> However, typically the people who would want to use this format don't
> care about filesystem shrinking.  They'd be fine with a solution that
> just prevents the filesystem from being shrunk.
> 
> Therefore, add a new feature flag EXT4_FEATURE_COMPAT_STABLE_INODES that
> will do exactly that.  Then wire up the fscrypt_operations to expose
> this flag to fs/crypto/, so that it allows IV_INO_LBLK_64 policies when
> this flag is set.
>
> Signed-off-by: Eric Biggers <ebiggers@google.com>

LGTM

Acked-by: Theodore Ts'o <tytso@mit.edu>

						- Ted


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
