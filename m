Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A008478046
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 28 Jul 2019 17:40:54 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hrlI3-0002E7-LU; Sun, 28 Jul 2019 15:40:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <tytso@mit.edu>) id 1hrlI2-0002Dv-Ax
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 28 Jul 2019 15:40:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OaxkpDzUJbsX+5v0wbTx3RARXQZpYtCB+4BNL6JwSYs=; b=E2M7FS5TRlA3b/rx2ZDouIe1k7
 HupLcFfm4kYaayqg5sEm7nT4IJSFVi8UWn2AHthTVKEe4g7kmxSldo1iLNu4sQ37A0PMOjlSrvMew
 oBiJHspnekJmIxT+ZJVVHMei2NijEtNSad9Fe53wRraDp5d09Foh5oBVRmrluWzJtI3A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OaxkpDzUJbsX+5v0wbTx3RARXQZpYtCB+4BNL6JwSYs=; b=DXo9xQ16eiPf2jWbTuLqZVqZnU
 t91ahfZ2RmOduMGOFsqWZWogjqTopvO5AzqPTUvNrRY2ddbIdJiWC5djNUHtgJk3fmM6bFzWFzhVz
 R7JdMbDQvChneCKMK0sIWso1FoD1ozOS5JXTmqBw9+fVGZeGrBP22l01MTGVK6chvYmk=;
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hrlHz-002Qsl-TO
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 28 Jul 2019 15:40:50 +0000
Received: from callcc.thunk.org (96-72-102-169-static.hfc.comcastbusiness.net
 [96.72.102.169] (may be forged)) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id x6SFeXgD004159
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 28 Jul 2019 11:40:34 -0400
Received: by callcc.thunk.org (Postfix, from userid 15806)
 id 6A6464202F5; Sun, 28 Jul 2019 11:40:32 -0400 (EDT)
Date: Sun, 28 Jul 2019 11:40:32 -0400
From: "Theodore Y. Ts'o" <tytso@mit.edu>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20190728154032.GE6088@mit.edu>
References: <20190726224141.14044-1-ebiggers@kernel.org>
 <20190726224141.14044-6-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190726224141.14044-6-ebiggers@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1hrlHz-002Qsl-TO
Subject: Re: [f2fs-dev] [PATCH v7 05/16] fscrypt: refactor v1 policy key
 setup into keysetup_legacy.c
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
Cc: Satya Tangirala <satyat@google.com>, linux-api@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fscrypt@vger.kernel.org,
 keyrings@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-crypto@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, Paul Crowley <paulcrowley@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Jul 26, 2019 at 03:41:30PM -0700, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> In preparation for introducing v2 encryption policies which will find
> and derive encryption keys differently from the current v1 encryption
> policies, refactor the v1 policy-specific key setup code from keyinfo.c
> into keysetup_legacy.c.  Then rename keyinfo.c to keysetup.c.

I'd use keysetup_v1.c, myself.  We can hope that we've gotten it right
with v2 and we'll never need to do another version, but *something* is
going to come up eventually which will require a v3 keysetup , whether
it's post-quantuum cryptography or something else we can't anticipate
right now.

For an example of the confusion that can result, one good example is
in the fs/quota subsystem, where QFMT_VFS_OLD, QFMT_VFS_V0, and
QFMT_VFS_V1 maps to quota_v1 and quota_v2 in an amusing and
non-obvious way.  (Go ahead, try to guess before you go look at the
code.  :-)

Other than that, looks good.  We can always move code around or rename
files in the future, so I'm not going to insist on doing it now (but
it would be my preference).

Reviewed-by: Theodore Ts'o <tytso@mit.edu>

						- Ted
						


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
