Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 479701164EB
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  9 Dec 2019 03:00:59 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ie8M5-00061d-1l; Mon, 09 Dec 2019 02:00:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <john@stoffel.org>) id 1ie8M2-00061N-PC
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 09 Dec 2019 02:00:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=53yoUe4jKEPtL9W16njFXW9UBUbhgCp07Y01Zi/VWmE=; b=VnME4LbL9bcfGi6OIPXcUDkHA4
 jg1EQVzuYLkTI1IQlPUO8tHP6HIOXxmPo0Ymllz2n5bisWy6inaw9VZETcAaIRcHbS3czOzoL1F2d
 FlwLifBGeGL7zkDEb9Exdr2P/LG1cb6ABNwmlLD7+ggUUey011lbVflwpDNkQquB5qyk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=53yoUe4jKEPtL9W16njFXW9UBUbhgCp07Y01Zi/VWmE=; b=gP5SK2J7xPmwmJgoqs6mAb4YFN
 nXhoMJJitubuyfOkw7iyCf08UPDT4EL3wiZE8XwkRp5D8wutpHmy+54nFFyPWr2a6VW0df12qSSX5
 /sl1hdlEdW0oOuP/K2tL6kB0UmfOXaKvDfgVdf1mXqDtltN0J+5cCnLmDBxvGO2BXMMc=;
Received: from li1843-175.members.linode.com ([172.104.24.175]
 helo=mail.stoffel.org) by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1ie8M1-00EZEN-A2
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 09 Dec 2019 02:00:54 +0000
Received: from quad.stoffel.org (66-189-75-104.dhcp.oxfr.ma.charter.com
 [66.189.75.104])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.stoffel.org (Postfix) with ESMTPSA id 80E521EDDC;
 Sun,  8 Dec 2019 21:00:42 -0500 (EST)
Received: by quad.stoffel.org (Postfix, from userid 1000)
 id E9A93A5DE1; Sun,  8 Dec 2019 21:00:41 -0500 (EST)
Date: Sun, 8 Dec 2019 21:00:41 -0500
From: John Stoffel <john@quad.stoffel.home>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20191209020041.et776tzhxqsqqfs5@quad.stoffel.home>
References: <1575718548-19017-1-git-send-email-yangtiezhu@loongson.cn>
 <20191208034144.GP4203@ZenIV.linux.org.uk>
 <20191208123804.GB32169@bombadil.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191208123804.GB32169@bombadil.infradead.org>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Spam-Score: 1.0 (+)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 0.8 DKIM_ADSP_NXDOMAIN     No valid author signature and domain not in DNS
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1ie8M1-00EZEN-A2
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
 Al Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, Tiezhu Yang <yangtiezhu@loongson.cn>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Sun, Dec 08, 2019 at 04:38:04AM -0800, Matthew Wilcox wrote:
> On Sun, Dec 08, 2019 at 03:41:44AM +0000, Al Viro wrote:
> > On Sat, Dec 07, 2019 at 07:35:48PM +0800, Tiezhu Yang wrote:
> > > There exists many similar and duplicate codes to check "." and "..",
> > > so introduce is_dot_dotdot helper to make the code more clean.
> > 
> > Umm...  No objections, in principle, but... you try to say that name
> > (e.g. in a phone conversation) without stuttering ;-/
> > 
> > Any suggestions from native speakers?
> 
> I used "is_dot_or_dotdot" when discussing this patch with my wife verbally.

*thumbs up*  Both for the wife, and the name.  :-)

-- 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
