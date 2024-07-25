Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC3893C475
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 25 Jul 2024 16:40:16 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sWzdU-0005P8-DZ;
	Thu, 25 Jul 2024 14:40:04 +0000
Received: from [172.30.29.67] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+eb6281b6209e17a76e98+7641+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1sWzdS-0005Oz-CC for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 25 Jul 2024 14:40:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fT+P3bL2alqk783XUIpMyvxWyxVKIMjRx9YDa8Msrv8=; b=GynBRVxsE+v/vttj3DmZUTmfy8
 wdoOT2Fz+RbasrEcQbYi8LeceUI7djNSVDgIhbGs0GpghEEdGZup0IKLO8QiVBNASHd4wb12XzCoa
 CiIRx1bFJK1BAJIRqejyjoGIRCtNmATAC8SVVvG0FwzGlxsP5+C8tV4LvFzH7ky6ySvs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fT+P3bL2alqk783XUIpMyvxWyxVKIMjRx9YDa8Msrv8=; b=mS4KW2evOL2bZ40MokHpA6Ar+C
 I3B9/3WNTizPUErEwwsP8hLfc6rnVQrE7ycCwz3g6v2Tz7ZkOSow8B9t3VD86OpXcVX7m3TBRe8zy
 qF3htqXwyl+9ox49wkZTLyFxjI5y5RFLR0YWhGlLpot83HjexJZVdO8PDaa9yficQlwo=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sWzdR-0005iB-GW for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 25 Jul 2024 14:40:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Transfer-Encoding
 :Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=fT+P3bL2alqk783XUIpMyvxWyxVKIMjRx9YDa8Msrv8=; b=WL5/OYQ+RT6V2Tl5hRTNfUjVwL
 oYtEItO5DN/EmTddff9oHpV7Z1VvU/Hz+Wd/ZHHcYbz51Wp7Pyq1+pk0K/7zQPkMmENAMlmbCODHD
 e5Vr8IhAmtm1e63eRQfIZYn4YhuFhEfyTM2m+FX40WG1cnKnrVwE7Qp3XJyhDFybOgRokQsOqhLVU
 exQ2/h/Jc8DM+0kWg1+tInyN9tyTGSg30g+Urn5OCITbb2OMIKeZqU36FmGsCWt4pMVGSDnv5zLvN
 cjcI8uRXUENjfZNyTD2zcw+U34WMrESbsJV14YTD1M0PxUQTTJxWSlubgoMyN5eOUzZyr4+eXPHz4
 BZFIqkRQ==;
Received: from hch by bombadil.infradead.org with local (Exim 4.97.1 #2 (Red
 Hat Linux)) id 1sWzdC-00000001Iql-2cGb;
 Thu, 25 Jul 2024 14:39:46 +0000
Date: Thu, 25 Jul 2024 07:39:46 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Youling Tang <youling.tang@linux.dev>
Message-ID: <ZqJjsg3s7H5cTWlT@infradead.org>
References: <20240723083239.41533-1-youling.tang@linux.dev>
 <20240723083239.41533-2-youling.tang@linux.dev>
 <Zp-_RDk5n5431yyh@infradead.org>
 <0a63dfd1-ead3-4db3-a38c-2bc1db65f354@linux.dev>
 <ZqEhMCjdFwC3wF4u@infradead.org>
 <895360e3-97bb-4188-a91d-eaca3302bd43@linux.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <895360e3-97bb-4188-a91d-eaca3302bd43@linux.dev>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Thu, Jul 25, 2024 at 11:01:33AM +0800, Youling Tang wrote:
    > - It doesn't feel good to have only one subinit/exit in a file. >   Assuming
    that there is only one file in each file, how do we >   ens [...] 
 
 Content analysis details:   (-5.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
                             blocked.  See
                             http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
                              for more information.
                             [URIs: infradead.org]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
                             high trust
                             [198.137.202.133 listed in list.dnswl.org]
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                           [198.137.202.133 listed in bl.score.senderscore.com]
  0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [198.137.202.133 listed in sa-accredit.habeas.com]
  0.0 SPF_NONE               SPF: sender does not publish an SPF Record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
X-Headers-End: 1sWzdR-0005iB-GW
Subject: Re: [f2fs-dev] [PATCH 1/4] module: Add module_subinit{_noexit} and
 module_subeixt helper macros
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
Cc: linux-arch@vger.kernel.org, Youling Tang <tangyouling@kylinos.cn>,
 linux-f2fs-devel@lists.sourceforge.net, tytso@mit.edu,
 Arnd Bergmann <arnd@arndb.de>, Josef Bacik <josef@toxicpanda.com>,
 linux-kernel@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
 Chris Mason <clm@fb.com>, Luis Chamberlain <mcgrof@kernel.org>,
 Andreas Dilger <adilger.kernel@dilger.ca>, linux-btrfs@vger.kernel.org,
 David Sterba <dsterba@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org, linux-modules@vger.kernel.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Jul 25, 2024 at 11:01:33AM +0800, Youling Tang wrote:
> - It doesn't feel good to have only one subinit/exit in a file.
> =A0 Assuming that there is only one file in each file, how do we
> =A0 ensure that the files are linked in order?(Is it sorted by *.o
> =A0 in the Makefile?)

Yes, link order already matterns for initialization order for built-in
code, so this is a well known concept.

> - Even if the order of each init is linked correctly, then the
> =A0 runtime will be iterated through the .subinitcall.init section,
> =A0 which executes each initfn in sequence (similar to do_initcalls),
> =A0 which means that no other code can be inserted between each subinit.

I don't understand this comment.  What do you mean with no other
code could be inserted?

> If module_subinit is called in module_init, other code can be inserted
> between subinit, similar to the following:
> =

> ```
> static int __init init_example(void)
> {
> =A0=A0 =A0module_subinit(inita, exita);
> =

> =A0=A0 =A0otherthing...
> =

> =A0=A0 =A0module_subinit(initb, exitb);
> =

> =A0=A0 =A0return 0;
> }

Yikes.  That's really not the point of having init calls, but just
really, really convoluted control flow.

> module_init(init_example);
> ```
> =

> IMHO, module_subinit() might be better called in module_init().

I strongly disagree.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
