Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8681684DC
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 21 Feb 2020 18:25:32 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j5C3P-00050k-Gu; Fri, 21 Feb 2020 17:25:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <BATV+b8b070cac54c30a96dd5+6025+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1j5C3O-00050d-Fr
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 21 Feb 2020 17:25:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0QbnwMFeVDLkBAGPBi1AUe4OscAIJxG3K9y7ARTuVaw=; b=YwseNxROk2Jm4FotS9HdT+itG7
 C7HhjYFgDqCMlG52na63+fqFYtn3MbjqjMYtHUsRJnbQLc/zKxvDQb+mZ50PUP6KOBZ+JLFeyo6z/
 JiUmwx1MNdXt3UWWPduAW8YJzZpU7nJmTF6VpTnv2kkcnM8oV1Tjv5A7U7yKa+Knb2e0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0QbnwMFeVDLkBAGPBi1AUe4OscAIJxG3K9y7ARTuVaw=; b=Px3/d4MP/qclMLv6mV+o+gEsD9
 ONtaedRAFNTcvfWbqspyIOnUE+dRa97wnTUZLCa1FaXSN7GoY2uJ/4u0+lJdqNQlhZWq4XEYndSqv
 Inb8jmKY24960czVnk+uAg11YnEZBe0gVRITSY3p5OzLeURt/pZkxToMwayorSF4D7KI=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j5C3K-008ha7-SP
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 21 Feb 2020 17:25:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=0QbnwMFeVDLkBAGPBi1AUe4OscAIJxG3K9y7ARTuVaw=; b=L4KkbhOjqVkaypvNUDvOXfv7t9
 K8/nVTJ8ARQLzQ406m0TrAdMdH6OeXkWGN6J9igcsSDbSWR8EDOKSM5wL2J331ZcVoCv9N2YTmZE6
 Vgch7/k4A1to0u5jHWFQdIEHyjlcQPj9WpbX3sCR0X3oZime9NNEs9TKjvrBeLd2h26UlndUS09PJ
 /pNrXUuiNO5xRrRX8lY+V9rKjITZanhEiwHrEzZL2Q1nZSk46vckirBd2QpK7OagqEFGiqn9hgfgv
 gZSQvRmoMXY0LSNR2UAWX9Zd3u8FHcgA+M/sDsjsms2HOCyZekSVrqCA6EszYMwMY83HFhtgJwybk
 FZOmizkg==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1j5C3A-0007Wf-2X; Fri, 21 Feb 2020 17:25:16 +0000
Date: Fri, 21 Feb 2020 09:25:16 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Satya Tangirala <satyat@google.com>
Message-ID: <20200221172516.GA23976@infradead.org>
References: <20200221115050.238976-1-satyat@google.com>
 <20200221115050.238976-4-satyat@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200221115050.238976-4-satyat@google.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
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
X-Headers-End: 1j5C3K-008ha7-SP
Subject: Re: [f2fs-dev] [PATCH v7 3/9] block: blk-crypto-fallback for Inline
 Encryption
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
Cc: linux-scsi@vger.kernel.org, Kim Boojin <boojin.kim@samsung.com>,
 Kuohong Wang <kuohong.wang@mediatek.com>,
 Barani Muthukumaran <bmuthuku@qti.qualcomm.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-block@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

That REQ_NO_SPECIAL think really needs a separate patch and be
explained.  In fact I hope we can get away without it as it is horrible,
so maybe the explanation will lead to a better outcome.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
