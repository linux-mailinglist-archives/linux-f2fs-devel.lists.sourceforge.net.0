Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 87DF740BFFD
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 15 Sep 2021 09:01:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mQOv7-0004Ie-Qe; Wed, 15 Sep 2021 07:01:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <BATV+8aa05ddd91fea3e0ef51+6597+infradead.org+hch@casper.srs.infradead.org>)
 id 1mQOut-0004HK-GW
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 Sep 2021 07:01:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EmP4/ZiTfWHx/8MiE7E2nDQre6o0X7QdlrjIGK58IFc=; b=ECrqWutHYvw8qQXMEiw+yoR7ey
 hAXTyHBIjRQQS+n6DZPpWXJPV2JiFg+rr3aLnIA37B/Td3iWfrA/3vYSJKAkYwwFQlFQDH5DNIXDM
 VMqy+mUxjuL/lVWcQKvxCWc3L6TFfk970+fk5pXmIgyMkA1TF0UqYHgBivIhreWqN7fk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=EmP4/ZiTfWHx/8MiE7E2nDQre6o0X7QdlrjIGK58IFc=; b=L
 Y8Pa0CrGbdwbgu3LzL/UViLxfHXax+IRUCs3gHpsnjXxC7TCku5zGHcfVmsLnn1mZjRjR4e2Ih4ZN
 FI9IhCnDvz6rsU6g/e+hNz1xj61lMAqbc2bHDy5kWYTfmr/iv670+GlujPcT4TXjG06ZPBUd/XN5Y
 Oii60Ajduq/uaKIU=;
Received: from [90.155.50.34] (helo=casper.infradead.org)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mQOul-00BFJn-1i
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 Sep 2021 07:01:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=EmP4/ZiTfWHx/8MiE7E2nDQre6o0X7QdlrjIGK58IFc=; b=IedtLFzVCvY2cp6KFC2YFMAu3r
 xw0mclnFSq0KxXKEDkj2T30cYTQe+M5nhx+D/AT+0QwTmhV1T3SZDubU3q5SWOHJjCDGP94npFwTv
 rJotmvDYEHjFl94DPkmsAkLEWNm6W4R9lgR3wwDK+EqDZkMimiIpWxXzCIqU1dPrkrlF1/o/D7Rtf
 94OhSfXPCMYLEjayZ6FxayvDqmfagpUferIKv3qthrSVTRAAWj/QSd3Y+/+2AJpMvfyTBR8pvVi3C
 7ju8flA3qm8mbD1K6nb9UzoKQqqcOR9pcnAug1ddulxrXkXWLGpIjyASBCUXjjhP87VaghWiP++04
 1jcM5VrA==;
Received: from [2001:4bb8:184:72db:8457:d7a:6e21:dd20] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQOtr-00FRT5-LU; Wed, 15 Sep 2021 07:00:18 +0000
From: Christoph Hellwig <hch@lst.de>
To: Gabriel Krisman Bertazi <krisman@collabora.com>
Date: Wed, 15 Sep 2021 08:59:55 +0200
Message-Id: <20210915070006.954653-1-hch@lst.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: 1.4 (+)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi all, this series is an alternate idea to split the utf8
 table into a separate module which comes together with a lot of cleanups.
 Changes since v1: - don't uglify the mount time messages from ext4/f2fs 
 Content analysis details:   (1.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: infradead.org]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 1.3 RDNS_NONE Delivered to internal network by a host with no rDNS
X-Headers-End: 1mQOul-00BFJn-1i
Subject: [f2fs-dev] unicode cleanups,
 and split the data table into a separate module v2
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
Cc: linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 Shreeya Patel <shreeya.patel@collabora.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi all,

this series is an alternate idea to split the utf8 table into a separate
module which comes together with a lot of cleanups.

Changes since v1:
 - don't uglify the mount time messages from ext4/f2fs

Diffstat:


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
