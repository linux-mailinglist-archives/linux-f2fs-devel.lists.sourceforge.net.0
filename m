Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E6B21AEC7
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 10 Jul 2020 07:34:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jtlg6-0005gg-Hl; Fri, 10 Jul 2020 05:34:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <BATV+9f3021a47afaa262729b+6165+infradead.org+hch@casper.srs.infradead.org>)
 id 1jtlg4-0005gS-TN
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 10 Jul 2020 05:34:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pVjWefAfqShBdQ1ZZJmJ6WwzyFiCXEB2I8I0n7n2VvA=; b=b6rD5zHbb3QSw5RLGNFVzXQicc
 4e+tlWn5VGMhHEXLlT8/Cy7AHjKNzYoKYbEj00dFFbrh0OSQOpYpY9Ua78djQZVZHrhGA5iRxEXm1
 hoOAOOFgRpwdrGyiEuYfrbDAZm7mAzU4ssyfv93NYiznazLatMHcaOKrNdwaO8VBbVGM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pVjWefAfqShBdQ1ZZJmJ6WwzyFiCXEB2I8I0n7n2VvA=; b=DMx2ESiSv7YwKp6boD1ux68wTS
 3ZSL9P4Q3UZbEfpuXt2Hjei1ngwGkDEbU4Oe7KI5lLCjNN3hxKphmrImocM4AiYxiR35xrJTgRLrR
 5fuW89l6B6MnynIlsU2D9bHkjIFekNZfeUPk7f54YKvE8jdtMpDOUa+HPYd74kTNYBi0=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jtlg1-00Csfs-Fq
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 10 Jul 2020 05:34:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=pVjWefAfqShBdQ1ZZJmJ6WwzyFiCXEB2I8I0n7n2VvA=; b=SUHqfj0xDvAG/k3lfL1KEXLiV2
 60PoTII6SdYLTmUHFeNDnuRi4A94mjv0BljVLGMx1uzxIWRZFKA/JoKuVBK/fS9c79Gt1D9WQJEnR
 ax0PRiqaz9VlGLTJ025lM0VOvZRrkcUlPyCJir7j4JfFtwZ4yA3+sxKhQNZuysRJU5L5JQqymDCss
 AiLX10BZ1YGeBBHGHKkXdbT19NKNg4OtqAoM6O7CcpNjxf7II92J/0zFOODZMjzhrrnkQWUetDlS8
 HYwJiW4o1RVw+MrxIY3lMCAI97+j0afkuWH4B81BilyO++t9EKd+qQseW+nQdd7QoigjYp9Y9H47o
 0RlKQclQ==;
Received: from hch by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1jtlfi-0006zt-Ec; Fri, 10 Jul 2020 05:34:06 +0000
Date: Fri, 10 Jul 2020 06:34:06 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Satya Tangirala <satyat@google.com>
Message-ID: <20200710053406.GA25530@infradead.org>
References: <20200709194751.2579207-1-satyat@google.com>
 <20200709194751.2579207-3-satyat@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200709194751.2579207-3-satyat@google.com>
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
X-Headers-End: 1jtlg1-00Csfs-Fq
Subject: Re: [f2fs-dev] [PATCH 2/5] direct-io: add support for fscrypt using
 blk-crypto
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
Cc: linux-fsdevel@vger.kernel.org, linux-fscrypt@vger.kernel.org,
 linux-ext4@vger.kernel.org, Eric Biggers <ebiggers@google.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Jul 09, 2020 at 07:47:48PM +0000, Satya Tangirala wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> Set bio crypt contexts on bios by calling into fscrypt when required,
> and explicitly check for DUN continuity when adding pages to the bio.
> (While DUN continuity is usually implied by logical block contiguity,
> this is not the case when using certain fscrypt IV generation methods
> like IV_INO_LBLK_32).

I know it is asking you for more work, but instead of adding more
features to the legacy direct I/O code, could you just switch the user
of it (I guess this is for f2f2?) to the iomap one?


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
