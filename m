Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A88BF8AABF
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 Aug 2019 00:53:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hxJCG-0000kw-6d; Mon, 12 Aug 2019 22:53:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <tytso@mit.edu>) id 1hxJCB-0000ki-Uo
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 12 Aug 2019 22:53:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JtqNxQUBc1aSTGCjoTigJq+XzgTA65cuKW99N64JAvc=; b=J2bVAYSuedxmXXQnIQhzzvbYm1
 xURoiIyD4lH04akTINZ5X/vrLcZ+8+o/V1JB+xd+EAPNN7DDY02R/kXGTKJ5ksYzDbs++QKKZ0l77
 QPhIYiFNMZLar0tfLKAPUgNbOE549TOy3+eyu1KQzG5iP1IRMC6xZ4ieErHOyyMau8M4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JtqNxQUBc1aSTGCjoTigJq+XzgTA65cuKW99N64JAvc=; b=bYydReezVrO4TXyIbOwGMnoHWL
 V+l56arSYJDVKKzIUO4xFwCVasx9dOwUY0Aw3qxpZi4wTOzzT8eNK2h1h5yWBGw7RskI8SAa2k4N/
 cnOTHVm07B3zhdTkKyVgrwJbTBZZIKvS/F59mN2+R+yqYNx1GRmhXdMwq+qv/uqS9O/o=;
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hxJCA-003GrD-D7
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 12 Aug 2019 22:53:43 +0000
Received: from callcc.thunk.org (guestnat-104-133-9-109.corp.google.com
 [104.133.9.109] (may be forged)) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id x7CMrSAa021619
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Aug 2019 18:53:30 -0400
Received: by callcc.thunk.org (Postfix, from userid 15806)
 id 3DFFB4218EF; Mon, 12 Aug 2019 18:53:28 -0400 (EDT)
Date: Mon, 12 Aug 2019 18:53:28 -0400
From: "Theodore Y. Ts'o" <tytso@mit.edu>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20190812225328.GF28705@mit.edu>
References: <20190805162521.90882-1-ebiggers@kernel.org>
 <20190805162521.90882-8-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190805162521.90882-8-ebiggers@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1hxJCA-003GrD-D7
Subject: Re: [f2fs-dev] [PATCH v8 07/20] fscrypt: move v1 policy key setup
 to keysetup_v1.c
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
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org,
 Paul Crowley <paulcrowley@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Aug 05, 2019 at 09:25:08AM -0700, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> In preparation for introducing v2 encryption policies which will find
> and derive encryption keys differently from the current v1 encryption
> policies, move the v1 policy-specific key setup code from keyinfo.c into
> keysetup_v1.c.
> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>

Looks good, you can add

Reviewed-by: Theodore Ts'o <tytso@mit.edu>



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
