Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A31533C912
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 15 Mar 2021 23:09:23 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lLvOl-0003l8-Ly; Mon, 15 Mar 2021 22:09:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <linux-f2fs-devel@nodmarc.danielabrecht.ch>)
 id 1lLvOk-0003l1-Hc
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 15 Mar 2021 22:09:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-ID:Subject:Cc:To:From:Date:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=x9IlFayMtYf7LQagzIyox3UzeTwFi3fQKh5rxNoy4Vo=; b=PK6RDnWbkqPBjfWciw7hpUhli
 yMaBAMf3Pth3v+0TzACoKNk/4n+z/74St6BnnaAGCJ1aOmNb/rxbX+guJlLOeeExjQHnOzsOAwQLc
 af1/BAV1/dX9ghKKLXm4wjqNlrfN3KOZgYhsKJHZjQeE5WQxGUcUUakYQce9dVnSZlnqk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:Content-Type
 :MIME-Version:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=x9IlFayMtYf7LQagzIyox3UzeTwFi3fQKh5rxNoy4Vo=; b=i
 y1L5Z8qJ3b/+9KCem2Ki8KyihBfe454iGTUGcmD3sPGVfc5rC5cCiWtyb/5pj63BhqbOK22zDnwdb
 q/vVnBhUjzmTjPSDbd1Fq6prpeXVzJMIyZf9m6WxUd4k3i3Cgjh006wRjwpVtz+n9PeOHa/bwFwE9
 1W2myTknsKoGs58g=;
Received: from 75-128-16-94.static.cable.fcom.ch ([94.16.128.75]
 helo=abrecht.li) by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lLvOW-003U6b-5r
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 15 Mar 2021 22:09:14 +0000
Received: from mail.abrecht.li (unknown [10.60.1.3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by abrecht.li (Postfix) with ESMTPSA id 949932D9998B;
 Mon, 15 Mar 2021 22:08:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 abrecht.li 949932D9998B
MIME-Version: 1.0
Date: Mon, 15 Mar 2021 22:08:53 +0000
From: Daniel Abrecht <linux-f2fs-devel@nodmarc.danielabrecht.ch>
To: linux-f2fs-devel@lists.sourceforge.net
Message-ID: <685cd73aea4daa72236ec53aa9c3a7fe@abrecht.li>
X-Sender: linux-f2fs-devel@nodmarc.danielabrecht.ch
User-Agent: Roundcube Webmail/1.3.16
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 TVD_RCVD_IP            Message was received from an IP address
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1lLvOW-003U6b-5r
Subject: [f2fs-dev]  [PATCH v2] Add -P option to preserve file owner
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

I use user namespaces & debootstrap to bootstrap a system, and then
copy that into an image using sload.f2fs. However, without an option to
preserve the owner user & group of files, some files end up being owned
by the wrong user / group (0:0), which causes all kinds of other issues

This patch adds an option -P to preserve the user and group of files.

Signed-off-by: Daniel Abrecht <public@danielabrecht.ch>
---
  fsck/main.c       | 6 +++++-
  fsck/sload.c      | 5 +++++
  include/f2fs_fs.h | 1 +
  man/sload.f2fs.8  | 7 +++++++
  4 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/fsck/main.c b/fsck/main.c
index a538c72..be30e00 100644
--- a/fsck/main.c
+++ b/fsck/main.c
@@ -138,6 +138,7 @@ void sload_usage()
  	MSG(0, "  -S sparse_mode\n");
  	MSG(0, "  -t mount point [prefix of target fs path, default:/]\n");
  	MSG(0, "  -T timestamp\n");
+	MSG(0, "  -P preserve owner: user and group\n");
  	MSG(0, "  -c enable compression (default allow policy)\n");
  	MSG(0, "    ------------ Compression sub-options 
-----------------\n");
  	MSG(0, "    -L <log-of-blocks-per-cluster>, default 2\n");
@@ -549,7 +550,7 @@ void f2fs_parse_options(int argc, char *argv[])
  #endif
  	} else if (!strcmp("sload.f2fs", prog)) {
  #ifdef WITH_SLOAD
-		const char *option_string = "cL:a:i:x:m:rC:d:f:p:s:St:T:V";
+		const char *option_string = "cL:a:i:x:m:rC:d:f:p:s:St:T:VP";
  #ifdef HAVE_LIBSELINUX
  		int max_nr_opt = (int)sizeof(c.seopt_file) /
  			sizeof(c.seopt_file[0]);
@@ -685,6 +686,9 @@ void f2fs_parse_options(int argc, char *argv[])
  			case 'V':
  				show_version(prog);
  				exit(0);
+			case 'P':
+				c.preserve_perms = 1;
+				break;
  			default:
  				err = EUNKNOWN_OPT;
  				break;
diff --git a/fsck/sload.c b/fsck/sload.c
index 4dea78b..6929023 100644
--- a/fsck/sload.c
+++ b/fsck/sload.c
@@ -187,6 +187,11 @@ static void set_inode_metadata(struct dentry *de)
  	else
  		de->mtime = c.fixed_time;

+	if (c.preserve_perms) {
+		de->uid = stat.st_uid;
+		de->gid = stat.st_gid;
+	}
+
  	set_perms_and_caps(de);
  }

diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
index a51a359..cdcce2c 100644
--- a/include/f2fs_fs.h
+++ b/include/f2fs_fs.h
@@ -505,6 +505,7 @@ struct f2fs_configuration {
  	struct selinux_opt seopt_file[8];
  	int nr_opt;
  #endif
+	int preserve_perms;

  	/* resize parameters */
  	int safe_resize;
diff --git a/man/sload.f2fs.8 b/man/sload.f2fs.8
index c165b35..ed5ee4b 100644
--- a/man/sload.f2fs.8
+++ b/man/sload.f2fs.8
@@ -18,6 +18,9 @@ sload.f2fs \- load directories and files into the 
device directly
  .I debugging-level
  ]
  [
+.B \-P
+]
+[
  .B \-c
  [
  .B \-L
@@ -66,6 +69,10 @@ Specify the mount point path in the partition to 
load.
  Specify the level of debugging options.
  The default number is 0, which shows basic debugging messages.
  .TP
+.BI \-P
+Preserve owner: user and group.
+The user and group of the source files will be taken into account.
+.TP
  .BI \-c
  Enable a cluster-based file compression.
  The file would be chopped into clusters, and each cluster is compressed
-- 
2.20.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
