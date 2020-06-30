Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F2820EDFD
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 30 Jun 2020 08:03:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jq9MX-0003pr-SV; Tue, 30 Jun 2020 06:03:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <BATV+6924b7a40190c3e6aa68+6155+infradead.org+hch@casper.srs.infradead.org>)
 id 1jq9MU-0003pj-Gj
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 30 Jun 2020 06:03:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=10n6fkJT5YFknRXlHwj9gjNGg/R91/iiEmizqFo2Wwo=; b=A1FAyFMs48v17d+OGzW+xpOznL
 5DVm9K946w2xEwQSvJ+8VG+b8WnNCDq85lLzCjmpM8Q9V3B4jPVIN4oDR60HcYaJD0NIygh0K5wU/
 OnEBse9b7iB1y1dLQcHDQgylDL5ZAuxNorchnC/C9vdzlPojqZ3p/4oL0CG+d6wbXJGw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=10n6fkJT5YFknRXlHwj9gjNGg/R91/iiEmizqFo2Wwo=; b=WmIbNa51IaVNPVG3xadymXgAQS
 XkzOIGYl1eC0BgXifDG0zTh2pPhCSyfIAX7gWQQ/trLFPwF+L5SI3PmnVxgRq2EdL3XXimro+InKU
 3XNXtPGR9SUj/IiC+PdRFVzL1X23dYZT80gAjNKh90xuInJbFcbOssoHKNEZaM9vhxQk=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jq9MP-006vn7-Nl
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 30 Jun 2020 06:03:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=10n6fkJT5YFknRXlHwj9gjNGg/R91/iiEmizqFo2Wwo=; b=KS/1RcoO2tBOxUo26C2OeBpqjl
 OB2sVaGqmZWJ+kuE7+75OHOwksmtSEVZNf0KN2lNbbk0YFvsUp8g7rb33mF9Rygtv5wn3lgzZTqcQ
 khfetKq77lCf6uZ5aoegLeRgrbxkfD9th0T/zwET+2XNS6OaFaYwljTfGureLmMCEM6xUmlALsOn6
 64lRKuziJU6P4RoeTfLQ1YJWx3PW+uzU5MLFefV1CBVi5nANFuxRSC3wsLmhnzFHvJOpDKlVhyZlz
 HPSfid7WCsQEdj3nRsPpNptdaSIlJen04FrqdMpG9XIJEksoqGon0zcHUxo8koUf5NuQ15sP9H+H+
 76vP82GA==;
Received: from hch by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1jq929-0007BL-K3; Tue, 30 Jun 2020 05:42:17 +0000
Date: Tue, 30 Jun 2020 06:42:17 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Eric Sandeen <sandeen@redhat.com>
Message-ID: <20200630054217.GA27221@infradead.org>
References: <c8271324-9132-388c-5242-d7699f011892@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c8271324-9132-388c-5242-d7699f011892@redhat.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1jq9MP-006vn7-Nl
Subject: Re: [f2fs-dev] [PATCH] doc: cgroup: add f2fs and xfs to supported
 list for writeback
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
Cc: Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs <linux-xfs@vger.kernel.org>,
 linux-mm@kvack.org, cgroups@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Jun 29, 2020 at 02:08:09PM -0500, Eric Sandeen wrote:
> f2fs and xfs have both added support for cgroup writeback:
> 
> 578c647 f2fs: implement cgroup writeback support
> adfb5fb xfs: implement cgroup aware writeback
> 
> so add them to the supported list in the docs.
> 
> Signed-off-by: Eric Sandeen <sandeen@redhat.com>
> ---
> 
> TBH I wonder about the wisdom of having this detail in
> the doc, as it apparently gets missed quite often ...

I'd rather remove the list of file systems.  It has no chance of
staying uptodate.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
