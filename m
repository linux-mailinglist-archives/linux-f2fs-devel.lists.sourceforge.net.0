Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A8D976C21
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 12 Sep 2024 16:30:35 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sokq3-0005Ku-Dm;
	Thu, 12 Sep 2024 14:30:28 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chrubis@suse.cz>) id 1sokq2-0005Ko-5k
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Sep 2024 14:30:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MzBnFAyLQF+vlq1GarSqIbDvVMHE8EQCB0bZigEJT1M=; b=WMfGHiGig0ul3zQj3Ach9+UiA+
 IkfZ1okzbx2f7tyoWZmnO/2dr+vERED5vd1Z0LPwI0IvkBP3nz3xw7/rDgq1E1zpQgo0gV4LN1X8R
 pPTMluW4ZwfbEHy4C63DvQTcWRVzo1bg3kt1IeA4mjsu8QXEFkfIF3KcH2/hTq9Ro/lA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MzBnFAyLQF+vlq1GarSqIbDvVMHE8EQCB0bZigEJT1M=; b=gGVn/7F1NFLC7+9/r0H1s1Q+nq
 R7vy4V83V9uGCQLlKCsVOcDHF6vfkN7k8uQk/GD3KdDY5keSRQwwwEEZfczihYCTLkZGpFfKaZ6Ke
 jwpvrvIycEALbqkD1KPA35FXeA2YWZGw4VDyod1hFh3iwCyaObuEsSrfs+TPeeayYmF8=;
Received: from smtp-out1.suse.de ([195.135.223.130])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1sokq1-0003X2-VG for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Sep 2024 14:30:26 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A390221B09;
 Thu, 12 Sep 2024 14:30:19 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8344113AD8;
 Thu, 12 Sep 2024 14:30:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id Z+LBD/v64maDBQAAD6G6ig
 (envelope-from <chrubis@suse.cz>); Thu, 12 Sep 2024 14:30:19 +0000
Date: Thu, 12 Sep 2024 16:29:13 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: kernel test robot <oliver.sang@intel.com>
Message-ID: <ZuL6uRAuIhAFTfJe@yuki.lan>
References: <202409122103.e45aa13b-oliver.sang@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <202409122103.e45aa13b-oliver.sang@intel.com>
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spam-Level: 
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Spam-Score: -4.00
X-Spam-Flag: NO
X-Rspamd-Queue-Id: A390221B09
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Score: -1.1 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hi! So what the test does is: - creates a sparse file
 (truncates
 an empty file to non-zero size) - starts N child processes that open the
 file and read it in chunks while they expect zeros to be read - starts a
 single writer child [...] 
 Content analysis details:   (-1.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.223.130 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 1.2 SUBJ_LACKS_WORDS       Subject is not short yet lacks words
X-Headers-End: 1sokq1-0003X2-VG
Subject: Re: [f2fs-dev] [LTP] [linus:master] [f2fs] 9f0f6bf427:
 ltp.ADSP069.fail
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
Cc: lkp@intel.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, oe-lkp@lists.linux.dev,
 Jaegeuk Kim <jaegeuk@kernel.org>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi!
So what the test does is:

- creates a sparse file (truncates an empty file to non-zero size)
- starts N child processes that open the file and read it in chunks
  while they expect zeros to be read
- starts a single writer child that opens the file with O_DIRECT
  and writes zeros to the file starting at some offset

And if the test fails it means that at some point one of the reader
children have seen inconsistent state.

-- 
Cyril Hrubis
chrubis@suse.cz


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
