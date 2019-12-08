Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF77116186
	for <lists+linux-f2fs-devel@lfdr.de>; Sun,  8 Dec 2019 13:38:46 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1idvph-0000Xn-LF; Sun, 08 Dec 2019 12:38:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <willy@infradead.org>) id 1idvpg-0000Xb-KJ
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 08 Dec 2019 12:38:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2ELcNaQndnrwr3FiX1NwpMEheNcsO2lBa0QVqsnMeCA=; b=lcj3+g7/vLr9oTRe1Z/lOfDor3
 l1aGNDhfcIiTQTkbtucleNvUiA4iTvX0duGr6DvBT7fpiLeBVVNwcknrInMTJEGr51EFKFPjh5HT1
 bF21/4PCC3M2x48oh9poLjj2iK+SvznMD+0fmOIiG39nF/VcH5slbTHjQ90hRDvdsr7E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2ELcNaQndnrwr3FiX1NwpMEheNcsO2lBa0QVqsnMeCA=; b=VtC11GjEaAMkyQht647TgnGyE0
 adzDlTusRnFO1+4ISbo64ansY17d4KgROmIzcakHv48juami8p9RbfULxRSj6US+X+atTVNN11We1
 eDWYcbdSYqEsPJwr63PisuvR2nCDlpi/Z3jYE7b0exmQrNuL55VKLpDMiEQY6fDkCGL8=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1idvpe-00EEHx-Lu
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 08 Dec 2019 12:38:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2ELcNaQndnrwr3FiX1NwpMEheNcsO2lBa0QVqsnMeCA=; b=U1XvJNbZbJPCjOt3AAVxDS0oF
 Mh4MI6C2RCv9V/mL1VeDkpDKRcIa5JCrtsA48oc1ZWffNGpUIw9aDPdgh/eY/Z/Q4WtyE7XL7R13H
 aNZLECIv8MGDhMqhxhCqK1oiWpsqzhojIEowfJv2H/LvRalBHVMMUfsS4I77I7ns/h7iIXi4HWqwb
 GyxnngdRgaYtkRI5xGHMfFDIC8rl7qT9qa1tjyHUshnhjuP/W8K7z2hDCCVU0qUcb7uczdDPfpylS
 gPg1CQlcwkjyKfXr2gYv2md+i1a3Ba+MfYDEpJDNCATOzq/5SM/3hvEgbW0A9/aYLu+vajeb1GHPp
 ylpQUn9Uw==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1idvp6-00061v-LN; Sun, 08 Dec 2019 12:38:04 +0000
Date: Sun, 8 Dec 2019 04:38:04 -0800
From: Matthew Wilcox <willy@infradead.org>
To: Al Viro <viro@zeniv.linux.org.uk>
Message-ID: <20191208123804.GB32169@bombadil.infradead.org>
References: <1575718548-19017-1-git-send-email-yangtiezhu@loongson.cn>
 <20191208034144.GP4203@ZenIV.linux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191208034144.GP4203@ZenIV.linux.org.uk>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1idvpe-00EEHx-Lu
Subject: Re: [f2fs-dev] [PATCH v3] fs: introduce is_dot_dotdot helper for
 cleanup
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
Cc: ecryptfs@vger.kernel.org, "Theodore Y. Ts'o" <tytso@mit.edu>,
 linux-kernel@vger.kernel.org, Tyler Hicks <tyhicks@canonical.com>,
 Eric Biggers <ebiggers@kernel.org>, linux-fscrypt@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 Tiezhu Yang <yangtiezhu@loongson.cn>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Sun, Dec 08, 2019 at 03:41:44AM +0000, Al Viro wrote:
> On Sat, Dec 07, 2019 at 07:35:48PM +0800, Tiezhu Yang wrote:
> > There exists many similar and duplicate codes to check "." and "..",
> > so introduce is_dot_dotdot helper to make the code more clean.
> 
> Umm...  No objections, in principle, but... you try to say that name
> (e.g. in a phone conversation) without stuttering ;-/
> 
> Any suggestions from native speakers?

I used "is_dot_or_dotdot" when discussing this patch with my wife verbally.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
